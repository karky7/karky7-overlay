# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A wrapper library that provides one API to read and write data"
HOMEPAGE="https://pypi.python.org/pypi/pyexcel/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
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
