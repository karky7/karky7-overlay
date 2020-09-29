# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
HOMEPAGE="https://pypi.org/project/sphinx-autobuild/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinx-autobuild/sphinx-autobuild-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        >=dev-python/sphinx-1.7.5[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
