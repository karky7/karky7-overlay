# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils multilib distutils-r1

DESCRIPTION="API to read and write data in different excel file formats"
HOMEPAGE="https://pypi.python.org/pypi/django-excel/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/django
dev-python/texttable
dev-python/pyexcel
"
RDEPEND="${DEPEND}"
