# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
HOMEPAGE="https://github.com/ikegami-yukino/jaconv"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	rm -f "${D}/usr/README.rst"
	rm -f "${D}/usr/CHANGES.rst"
}
