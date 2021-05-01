# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="A wrapper library that provides one API to read and write data"
HOMEPAGE="https://pypi.python.org/pypi/pyexcel/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pyexcel-io
dev-python/xlrd3
dev-python/pyexcel-xls
dev-python/pyexcel-xlsx
dev-python/pyexcel-xlsxw
dev-python/pyexcel-ods3
dev-python/pyexcel-ods
dev-python/pyexcel-odsr
dev-python/pyexcel-text
dev-python/pyexcel-chart"
RDEPEND="${DEPEND}"
