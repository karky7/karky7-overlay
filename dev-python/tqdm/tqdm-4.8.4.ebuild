# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Fast, Extensible Progress Meter"
HOMEPAGE="https://pypi.python.org/pypi/tqdm/${PV}"
SRC_URI="mirror://pypi/t/${PN}/${P}.tar.gz"

LICENSE="MPLv2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
