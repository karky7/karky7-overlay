# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1

DESCRIPTION="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
HOMEPAGE="http://imageio.github.io"
SRC_URI="mirror://pypi/i/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
