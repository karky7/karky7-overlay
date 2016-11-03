# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Bazel build system"
HOMEPAGE="http://bazel.io/"
SRC_URI="https://github.com/bazelbuild/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="strip"

src_prepare() {
		epatch "${FILESDIR}/${P}-java-1.7.patch"
}

src_configure() {
        :
}

src_compile() {
        ./compile.sh
}

src_install() {
		mkdir -p ${ED}/usr/bin
		cp -a --reflink=auto output/${PN} ${ED}/usr/bin/

		mkdir -p ${ED}/usr/lib/${PN}
		tar -h -c base_workspace | tar -C ${ED}/usr/lib/${PN} -x
}
