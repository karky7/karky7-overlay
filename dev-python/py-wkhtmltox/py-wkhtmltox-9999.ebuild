# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils multilib distutils-r1 git-r3

DESCRIPTION="Python bindings for the fabulous libwkhtmltox using Cython"
HOMEPAGE="https://github.com/mreiferson/py-wkhtmltox"
EGIT_REPO_URI="https://github.com/karky7/py-wkhtmltox.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-gfx/wkhtmltopdf"
RDEPEND="${DEPEND}"
