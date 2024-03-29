# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="manipulate and write data in xlsx and xlsm format for python"
HOMEPAGE="https://pypi.python.org/pypi/pyexcel-xlsx/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pyexcel-io
dev-python/openpyxl"
RDEPEND="${DEPEND}"
