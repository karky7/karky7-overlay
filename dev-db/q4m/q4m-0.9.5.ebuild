# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/mysql-plugins/q4m-0.9.5.ebuild,v 1.1 2012/01/10 06:57:20 sbriesen Exp $

EAPI=3

inherit autotools eutils toolchain-funcs

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=""
	inherit git-2
	SRC_URI=""
	#KEYWORDS=""
else
	SRC_URI="http://q4m.kazuhooku.com/dist/${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
fi

DESCRIPTION="Q4M a message queue plugin for MySQL"
HOMEPAGE="http://q4m.github.com/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-static"

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
    /bin/sh ${FILESDIR}/mysql_src_setup.sh "/usr/portage/${MYSQL_BEST_VERSION2}" || die "MySQL source unpak failure"
    
    MYSQL_SRC_DIR="/var/tmp/portage/${MYSQL_BEST_VERSION}/work/mysql"
    unpack ${A}
    cd "${S}"
}

src_prepare() {
    epatch "${FILESDIR}/q4m-0.9.5-1.patch"
    eautoreconf -if || die "eautoreconf failure"
}

src_configure() {
    econf \
        --with-mysql=${MYSQL_SRC_DIR}
}

src_compile() {
    emake
}

src_install() {
    emake \
    	  DESTDIR="${D}" \
	  install || die "Install failed"
}

pkg_postinst() {
    elog "Clean up MySQL source directory"
    /bin/sh ${FILESDIR}/mysql_src_uninstall.sh "/usr/portage/${MYSQL_BEST_VERSION2}" || die "MySQL source unpak failure"
}
