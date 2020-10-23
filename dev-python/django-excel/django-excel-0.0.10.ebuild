# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit eutils multilib distutils-r1

DESCRIPTION="API to read and write data in different excel file formats"
HOMEPAGE="https://pypi.python.org/pypi/django-excel/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/django
dev-python/texttable
dev-python/pyexcel
"
RDEPEND="${DEPEND}"
