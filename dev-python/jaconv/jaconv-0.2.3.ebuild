# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5,6} pypy pypy3 )

inherit eutils distutils-r1

DESCRIPTION="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
HOMEPAGE="https://github.com/ikegami-yukino/jaconv"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	rm -f "${D}/usr/README.rst"
	rm -f "${D}/usr/CHANGES.rst"
}
