# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="MoviePy (full documentation here_) is a Python module for video editing"
HOMEPAGE="https://zulko.github.io/moviepy/"
SRC_URI="https://pypi.python.org/packages/source/m/moviepy/moviepy-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/opencv
dev-python/pillow
dev-python/numpy
dev-python/tqdm
dev-python/imageio
dev-python/scipy
media-video/ffmpeg
media-gfx/imagemagick"
RDEPEND="${DEPEND}"
