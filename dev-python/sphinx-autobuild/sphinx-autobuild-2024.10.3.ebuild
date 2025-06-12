# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# DISTUTILS_USE_PEP517=setuptools
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
HOMEPAGE="https://pypi.org/project/sphinx-autobuild/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinx-autobuild/sphinx_autobuild-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/starlette[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/watchfiles[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest

# python_prepare_all() {
# 	distutils-r1_python_prepare_all
# }

python_install_all() {
	distutils-r1_python_install_all
}
