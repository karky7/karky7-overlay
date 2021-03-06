
# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/mysql-plugins/HandlerSocket-Plugin-for-MySQL-9999.ebuild,v 1.1 2012/01/10 06:57:20 sbriesen Exp $

EAPI=7

inherit autotools eutils toolchain-funcs git-r3

EGIT_REPO_URI="git://github.com/ahiguti/HandlerSocket-Plugin-for-MySQL.git"
SRC_URI=""
KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"

DESCRIPTION="HandlerSocket plugin for MySQL"
HOMEPAGE="https://github.com/DeNADev/HandlerSocket-Plugin-for-MySQL"

LICENSE="BSD"
SLOT="0"
IUSE="debug "
DEPEND=">=virtual/mysql-5.1"
RDEPEND="${DEPEND}"

pkg_setup() {
    MYSQL_PLUGINDIR="$(mysql_config --plugindir)"
    MYSQL_INCLUDE="$(mysql_config --include)"
    MYSQL_VERSION="$(mysql_config --version)"
}

src_unpack() {
    git-3_src_unpack
    MYSQL_BEST_VERSION="$(best_version dev-db/mysql)"
    MYSQL_BEST_VERSION2="$(echo ${MYSQL_BEST_VERSION} | sed -e "s/dev-db\//dev-db\/mysql\//")"
    /bin/sh ${FILESDIR}/mysql_src_setup.sh "/usr/portage/${MYSQL_BEST_VERSION2}" || die "MySQL source unpak failure"
    
    MYSQL_SRC_DIR="/var/tmp/portage/${MYSQL_BEST_VERSION}/work/mysql"
    cd "${S}"
}

src_prepare() {
    ./autogen.sh
}

src_configure() {
    if use debug; then
      use_enable debug  
    fi
    econf \
        --with-mysql-source=${MYSQL_SRC_DIR}   
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
