# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils multilib distutils-r1

DESCRIPTION="A generic request and response interface for pyexcel web extensions."
HOMEPAGE="https://pypi.python.org/pypi/pyexcel-webio/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pyexcel
dev-python/pyexcel-io"
RDEPEND="${DEPEND}"
