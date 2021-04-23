# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils toolchain-funcs

SRC_URI="http://q4m.kazuhooku.com/dist/${P}.tar.gz"
KEYWORDS="-* ~amd64 ~x86"
DESCRIPTION="Q4M a message queue plugin for MySQL"
HOMEPAGE="http://q4m.github.com/"

LICENSE="GPL-2"
SLOT="0"
IUSE="+mmap +pwrite debug"

DEPEND=">=virtual/mysql-5.1"
RDEPEND="${DEPEND}"

pkg_setup() {
	MYSQL_PLUGINDIR="$(mysql_config --plugindir)"
	MYSQL_INCLUDE="$(mysql_config --include)"
	MYSQL_VERSION="$(mysql_config --version)"
}

src_unpack() {
	MYSQL_BEST_VERSION="$(best_version dev-db/mysql)"
	MYSQL_BEST_VERSION2="$(echo ${MYSQL_BEST_VERSION} | sed -e "s/dev-db\//dev-db\/mysql\//")"
	/bin/sh "${FILES}/mysql_src_setup.sh" "/usr/portage/${MYSQL_BEST_VERSION2}" || die "MySQL source unpak failure"

	MYSQL_SRC_DIR="/var/tmp/portage/${MYSQL_BEST_VERSION}/work/mysql"
	unpack ${A}
	cd "${S}"
}

src_prepare() {
	epatch "${FILESDIR}/q4m-0.9.5-1.patch"
	eautoreconf -if || die "eautoreconf failure"
}

src_configure() {
	# sample
	# use berkdb   || use gdbm || disable+=" dbm"
	if use mmap; then
		enable_mmap="--enable-mmap=yes"
	else
		enable_mmap="--enable-mmap=no"
	fi

	if use pwrite; then
		with_delete="--with-delete=pwrite"
	else
		with_delete="--with-delete=msync"
	fi

	if use debug; then
		with_debug="--with-debug"
	fi

	econf \
		--libdir=${MYSQL_PLUGINDIR} \
		${enable_mmap} \
		${with_debug} \
		${with_delete} \
		--with-mysql=${MYSQL_SRC_DIR}
}

src_install() {
	emake \
		  DESTDIR="${D}" \
	  install || die "Install failed"
}

pkg_postinst() {
	elog "Clean up MySQL source directory"
	/bin/sh "${FILES}/mysql_src_uninstall.sh" "/usr/portage/${MYSQL_BEST_VERSION2}" || die "MySQL source unpak failure"
}
