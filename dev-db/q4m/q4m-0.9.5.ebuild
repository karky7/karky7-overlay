# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/mysql-plugins/q4m-0.9.5.ebuild,v 1.1 2012/01/10 06:57:20 sbriesen Exp $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Q4M a message queue plugin for MySQL"
HOMEPAGE="http://q4m.github.com/"
SRC_URI="http://q4m.kazuhooku.com/dist/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/mysql-5.1"
RDEPEND="${DEPEND}"

pkg_setup() {
	MYSQL_PLUGINDIR="$(mysql_config --plugindir)"
	MYSQL_INCLUDE="$(mysql_config --include)"
	MYSQL_VERSION="$(mysql_config --version)"
	elog "======>   Version ${MYSQL_VERSION}"
}

src_prepare() {
        elog "======>   Prepare!!!!!!!!!!!!!!!!!!!!"
	ebuild /usr/portage/dev-db/mysql/mysql-$(MYSQL_VERSION).ebuild unpack
}

src_compile() {
        elog "======>   Compile!!!!!!!!!!!!!!!!!!!!!"
}

src_install() {
        elog "Install"
	# exeinto "${MYSQL_PLUGINDIR}"
	# doexe *.so
}

pkg_postinst() {
	elog "OK ended"
}
