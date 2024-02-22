# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..12} )

inherit eutils multilib distutils-r1

DESCRIPTION="Lib to create sheet files compati MS Excel 97/2k/XP/2k3 XLS files"
HOMEPAGE="https://pypi.python.org/pypi/xlwt/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
