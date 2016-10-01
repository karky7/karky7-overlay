# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{2,3,4}} )

inherit eutils multilib distutils-r1

DESCRIPTION="MoviePy (full documentation here_) is a Python module for video editing"
HOMEPAGE="http://zulko.github.io/moviepy/"
SRC_URI="http://pypi.python.org/packages/source/m/moviepy/moviepy-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="media-libs/opencv
dev-python/pillow
dev-python/numpy
dev-python/tqdm
dev-python/imageio
sci-libs/scipy
media-video/ffmpeg
media-gfx/imagemagick"
RDEPEND="${DEPEND}"