# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

MY_P="${PN/oracle-/}-linux.x64-${PV}"
MY_PSDK="${MY_P/basic/sdk}"
# MY_PLIB="occi_gcc343_x86_64_102030"
MY_PLIB=""

S=${WORKDIR}
DESCRIPTION="Oracle 12g client installation for Linux with SDK"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
DOWNLOADPAGE="http://www.oracle.com/technology/tech/oci/occi/occidownloads.html"
SRC_URI="${MY_P}.zip ${MY_PSDK}.zip" # ${MY_PLIB_amd64}.tar.gz"

LICENSE="OTN"
SLOT="0"
# KEYWORDS="-* amd64"
RESTRICT="fetch"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="|| ( virtual/libstdc++ sys-devel/gcc )"

pkg_setup() {
	export ${!MY_P}
	export ${!MY_PSDK}
	# export MY_PLIB=${!MY_PLIB}
}

pkg_nofetch() {
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "select your platform and download the"
	eerror "Basic client package with SDK, which are:"
	eerror "  ${MY_P}.zip"
	# eerror "  ${MY_PSDK}.zip"
	eerror ""
	eerror "Then go to:"
	eerror "  ${DOWNLOADPAGE}"
	# eerror "select your platform and download the"
	# eerror "  ${MY_PLIB}.tar.gz"
	eerror ""
	eerror "Then after downloading put them in:"
	eerror "  ${DISTDIR}"
}

src_unpack() {
	unzip "${DISTDIR}"/${MY_P}.zip || die "unsuccesful unzip ${MY_P}.zip"
	unzip "${DISTDIR}"/${MY_PSDK}.zip || die "unsuccesful unzip ${MY_PSDK}.zip"
	# tar -xvf "${DISTDIR}"/${MY_PLIB}.tar.gz || die "unsuccesful untar ${MY_PLIB}.tar.gz"
}

src_install() {
	# Patch the SDK makefile
	# epatch "${FILESDIR}"/${P}-makefile.patch

	# SDK makefile
	dodir /usr/$(get_libdir)/oracle/${PV}/client/rdbms/demo
	cd "${S}"/instantclient_12_2/sdk/demo
	mv demo.mk demo_xe.mk
	insinto /usr/$(get_libdir)/oracle/${PV}/client/rdbms/demo
	doins demo_xe.mk

	# library
	dodir /usr/$(get_libdir)/oracle/${PV}/client/lib
	cd "${S}"/instantclient_12_2
	insinto /usr/$(get_libdir)/oracle/${PV}/client/lib
	doins *.jar *.so *.so.12.1

	# overwrite library
	cd "${S}"
	insinto /usr/$(get_libdir)/oracle/${PV}/client/lib
	doins *.so.12.1 *.a

	# fixes symlinks
	dosym /usr/$(get_libdir)/oracle/${PV}/client/lib/libocci.so.12.1 /usr/$(get_libdir)/oracle/${PV}/client/lib/libocci.so
	dosym /usr/$(get_libdir)/oracle/${PV}/client/lib/libclntsh.so.12.1 /usr/$(get_libdir)/oracle/${PV}/client/lib/libclntsh.so
	dosym /usr/$(get_libdir)/oracle/${PV}/client/include /usr/$(get_libdir)/oracle/${PV}/client/rdbms/public

	# includes
	dodir /usr/$(get_libdir)/oracle/${PV}/client/include
	insinto /usr/$(get_libdir)/oracle/${PV}/client/include
	cd "${S}"/instantclient_12_2/sdk/include
	doins *.h
	# link to original location
	dodir /usr/include/oracle/${PV}/
	ln -s "${D}"/usr/$(get_libdir)/oracle/${PV}/client/include "${D}"/usr/include/oracle/${PV}/client

	# share info
	cd "${S}"/instantclient_12_2/sdk/demo
	dodoc *

	# Add OCI libs to library path
	dodir /etc/env.d
	echo "ORACLE_HOME=/usr/$(get_libdir)/oracle/${PV}/client" >> "${D}"/etc/env.d/50oracle-instantclient-basic
	echo "LDPATH=/usr/$(get_libdir)/oracle/${PV}/client/lib" >> "${D}"/etc/env.d/50oracle-instantclient-basic
	echo "C_INCLUDE_PATH=/usr/$(get_libdir)/oracle/${PV}/client/include" >> "${D}"/etc/env.d/50oracle-instantclient-basic
	echo "TNS_ADMIN=/etc/oracle/" >> "${D}"/etc/env.d/50oracle-instantclient-basic

	# create path for tnsnames.ora
	dodir /etc/oracle
}

pkg_postinst() {
	elog "The Basic client page for Oracle 12g has been installed."
	elog "You may also wish to install the oracle-instantclient-jdbc (for"
	elog "supplemental JDBC functionality with Oracle) and the"
	elog "oracle-instantclient-sqlplus (for running the SQL*Plus application)"
	elog "packages as well."
	elog
	elog "Examples are located in /usr/share/doc/${PF}/"
	elog
	elog "oracle-instantclient-* packages aren't installed in different"
	elog "SLOTs any longer. You may want to uninstall older versions."
	elog
	elog "TNS_ADMIN has been set to "${ROOT}"etc/oracle by default, put your"
	elog "tnsnames.ora there or configure TNS_ADMIN to point to"
	elog "your user specific configuration."
}
