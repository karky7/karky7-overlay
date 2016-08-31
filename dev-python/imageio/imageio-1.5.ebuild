# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{2,3,4}} )

inherit eutils multilib distutils-r1

DESCRIPTION="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
HOMEPAGE="http://imageio.github.io"
SRC_URI="mirror://pypi/i/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
