# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

MY_EXTRAS_VER="20150410-1944Z"
MY_PV="${PV//_alpha_pre/-m}"
MY_PV="${MY_PV//_/-}"

inherit toolchain-funcs mysql-multilib-r1
# only to make repoman happy. it is really set in the eclass
IUSE="$IUSE"

# REMEMBER: also update eclass/mysql*.eclass before committing!
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x64-solaris ~x86-solaris"

# When MY_EXTRAS is bumped, the index should be revised to exclude these.
EPATCH_EXCLUDE=''

DEPEND="|| ( >=sys-devel/gcc-3.4.6 >=sys-devel/gcc-apple-4.0 )"
RDEPEND="${RDEPEND}"

Q4M_VER="0.9.14"
Q4M_PKG="q4m-0.9.14"
Q4M_SRC="${Q4M_PKG}.tar.gz"

SRC_URI="$SRC_URI
   ( https://github.com/q4m/q4m/archive/${Q4M_VER}.tar.gz )"

# Please do not add a naive src_unpack to this ebuild
# If you want to add a single patch, copy the ebuild to an overlay
# and create your own mysql-extras tarball, looking at 000_index.txt

# Official test instructions:
# USE='embedded extraengine perl ssl static-libs community' \
# FEATURES='test userpriv -usersandbox' \
# ebuild mysql-X.X.XX.ebuild \
# digest clean package
multilib_src_test() {

	if ! multilib_is_native_abi ; then
		einfo "Server tests not available on non-native abi".
		return 0;
	fi

	local TESTDIR="${BUILD_DIR}/mysql-test"
	local retstatus_unit
	local retstatus_tests

	# Bug #213475 - MySQL _will_ object strenously if your machine is named
	# localhost. Also causes weird failures.
	[[ "${HOSTNAME}" == "localhost" ]] && die "Your machine must NOT be named localhost"

	if ! use "minimal" ; then

		if [[ $UID -eq 0 ]]; then
			die "Testing with FEATURES=-userpriv is no longer supported by upstream. Tests MUST be run as non-root."
		fi
		has usersandbox $FEATURES && eerror "Some tests may fail with FEATURES=usersandbox"

		einfo ">>> Test phase [test]: ${CATEGORY}/${PF}"
		addpredict /this-dir-does-not-exist/t9.MYI

		# Run CTest (test-units)
		cmake-utils_src_test
		retstatus_unit=$?
		[[ $retstatus_unit -eq 0 ]] || eerror "test-unit failed"

		# Ensure that parallel runs don't die
		export MTR_BUILD_THREAD="$((${RANDOM} % 100))"
		# Enable parallel testing, auto will try to detect number of cores
		# You may set this by hand.
		# The default maximum is 8 unless MTR_MAX_PARALLEL is increased
		export MTR_PARALLEL="${MTR_PARALLEL:-auto}"

		# create directories because mysqladmin might right out of order
		mkdir -p "${T}"/var-tests{,/log}

		# create symlink for the tests to find mysql_tzinfo_to_sql
		ln -s "${BUILD_DIR}/sql/mysql_tzinfo_to_sql" "${S}/sql/"

		# These are failing in MySQL 5.5/5.6 for now and are believed to be
		# false positives:
		#
		# main.information_schema, binlog.binlog_statement_insert_delayed,
		# funcs_1.is_triggers funcs_1.is_tables_mysql,
		# funcs_1.is_columns_mysql, binlog.binlog_mysqlbinlog_filter,
		# perfschema.binlog_edge_mix, perfschema.binlog_edge_stmt,
		# mysqld--help-notwin, funcs_1.is_triggers, funcs_1.is_tables_mysql, funcs_1.is_columns_mysql
		# perfschema.binlog_edge_stmt, perfschema.binlog_edge_mix, binlog.binlog_mysqlbinlog_filter
		# fails due to USE=-latin1 / utf8 default
		#
		# main.mysql_client_test:
		# segfaults at random under Portage only, suspect resource limits.
		#
		# rpl.rpl_plugin_load
		# fails due to included file not listed in expected result
		# appears to be poor planning
		#
		# main.mysqlhotcopy_archive main.mysqlhotcopy_myisam
		# fails due to bad cleanup of previous tests when run in parallel
		# The tool is deprecated anyway
		# Bug 532288
		for t in \
			binlog.binlog_mysqlbinlog_filter \
			binlog.binlog_statement_insert_delayed \
			funcs_1.is_columns_mysql \
			funcs_1.is_tables_mysql \
			funcs_1.is_triggers \
			main.information_schema \
			main.mysql_client_test \
			main.mysqld--help-notwin \
			perfschema.binlog_edge_mix \
			perfschema.binlog_edge_stmt \
			rpl.rpl_plugin_load \
			main.mysqlhotcopy_archive main.mysqlhotcopy_myisam \
		; do
				mysql-multilib_disable_test  "$t" "False positives in Gentoo"
		done

		if ! use extraengine ; then
			# bug 401673, 530766
			for t in federated.federated_plugin ; do
				mysql-multilib_disable_test  "$t" "Test $t requires USE=extraengine (Need federated engine)"
			done
		fi

		# Run mysql tests
		pushd "${TESTDIR}"

		# Set file limits higher so tests run
		ulimit -n 3000

		# run mysql-test tests
		perl mysql-test-run.pl --force --vardir="${T}/var-tests" \
			--suite-timeout=5000
		retstatus_tests=$?
		[[ $retstatus_tests -eq 0 ]] || eerror "tests failed"
		has usersandbox $FEATURES && eerror "Some tests may fail with FEATURES=usersandbox"

		popd

		# Cleanup is important for these testcases.
		pkill -9 -f "${S}/ndb" 2>/dev/null
		pkill -9 -f "${S}/sql" 2>/dev/null

		failures=""
		[[ $retstatus_unit -eq 0 ]] || failures="${failures} test-unit"
		[[ $retstatus_tests -eq 0 ]] || failures="${failures} tests"
		has usersandbox $FEATURES && eerror "Some tests may fail with FEATURES=usersandbox"

		[[ -z "$failures" ]] || die "Test failures: $failures"
		einfo "Tests successfully completed"

	else

		einfo "Skipping server tests due to minimal build."
	fi
}




multilib_src_configure() {

	debug-print-function ${FUNCNAME} "$@"

	CMAKE_BUILD_TYPE="RelWithDebInfo"

	# debug hack wrt #497532
	mycmakeargs=(
		-DCMAKE_C_FLAGS_RELWITHDEBINFO="$(usex debug "" "-DNDEBUG")"
		-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="$(usex debug "" "-DNDEBUG")"
		-DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr
		-DMYSQL_DATADIR=${EPREFIX}/var/lib/mysql
		-DSYSCONFDIR=${EPREFIX}/etc/mysql
		-DINSTALL_BINDIR=bin
		-DINSTALL_DOCDIR=share/doc/${P}
		-DINSTALL_DOCREADMEDIR=share/doc/${P}
		-DINSTALL_INCLUDEDIR=include/mysql
		-DINSTALL_INFODIR=share/info
		-DINSTALL_LIBDIR=$(get_libdir)
		-DINSTALL_ELIBDIR=$(get_libdir)/mysql
		-DINSTALL_MANDIR=share/man
		-DINSTALL_MYSQLDATADIR=${EPREFIX}/var/lib/mysql
		-DINSTALL_MYSQLSHAREDIR=share/mysql
		-DINSTALL_MYSQLTESTDIR=share/mysql/mysql-test
		-DINSTALL_PLUGINDIR=$(get_libdir)/mysql/plugin
		-DINSTALL_SBINDIR=sbin
		-DINSTALL_SCRIPTDIR=share/mysql/scripts
		-DINSTALL_SQLBENCHDIR=share/mysql
		-DINSTALL_SUPPORTFILESDIR=${EPREFIX}/usr/share/mysql
		-DWITH_COMMENT="Gentoo Linux ${PF}"
		$(cmake-utils_use_with test UNIT_TESTS)
		-DWITH_LIBEDIT=0
		-DWITH_ZLIB=bundled
		-DWITHOUT_LIBWRAP=1
		-DENABLED_LOCAL_INFILE=1
		-DMYSQL_UNIX_ADDR=${EPREFIX}/var/run/mysqld/mysqld.sock
		-DINSTALL_UNIX_ADDRDIR=${EPREFIX}/var/run/mysqld/mysqld.sock
		-DWITH_SSL=$(usex ssl system bundled)
		-DWITH_DEFAULT_COMPILER_OPTIONS=0
		-DWITH_DEFAULT_FEATURE_SET=0
	)

	# systemtap only works on native ABI  bug 530132
	if multilib_is_native_abi; then
		mycmakeargs+=( $(cmake-utils_use_enable systemtap DTRACE) )
	else
		mycmakeargs+=( -DENABLE_DTRACE=0 )
	fi

	if in_iuse bindist ; then
		mycmakeargs+=(
			-DWITH_READLINE=$(usex bindist 1 0)
			-DNOT_FOR_DISTRIBUTION=$(usex bindist 0 1)
			$(usex bindist -DHAVE_BFD_H=0 '')
		)
	fi

	### TODO: make this system but issues with UTF-8 prevent it
	mycmakeargs+=( -DWITH_EDITLINE=bundled )

	if [[ ${PN} == "mariadb" || ${PN} == "mariadb-galera" ]] ; then
		mycmakeargs+=(
			-DWITH_JEMALLOC=$(usex jemalloc system)
		)

		mysql_version_is_at_least "10.0.9" && mycmakeargs+=( -DWITH_PCRE=system )
	fi

	configure_cmake_locale

	if multilib_is_native_abi && ! use minimal ; then
		configure_cmake_standard
	else
		configure_cmake_minimal
	fi

	# Always build NDB with mysql-cluster for libndbclient
	[[ ${PN} == "mysql-cluster" ]] && mycmakeargs+=(
		-DWITH_NDBCLUSTER=1 -DWITH_PARTITION_STORAGE_ENGINE=1
		-DWITHOUT_PARTITION_STORAGE_ENGINE=0 )

	cmake-utils_src_configure
}

src_prepare() {
	cp -rf ${WORKDIR}/${Q4M_PKG} ${WORKDIR}/mysql/storage/q4m
	einfo "copying q4m to mysql strage directory."
	epatch "${WORKDIR}/mysql/storage/q4m/support-files/5.6-select-where-queue-wait.patch" || die "error q4m patch failed"
	einfo "complete q4m patch."

}

pkg_postinst() {
	cp -rf ${WORKDIR}/mysql/storage/q4m/support-files ${ROOT}/usr/share/mysql/
	einfo "copy q4m support files."
}
