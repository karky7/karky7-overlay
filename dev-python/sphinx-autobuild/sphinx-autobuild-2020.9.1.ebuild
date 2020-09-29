# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=no
PYTHON_COMPAT=( python3_{6,7,8} )

inherit bash-completion-r1 distutils-r1

DESCRIPTION="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
HOMEPAGE="https://pypi.org/project/sphinx-autobuild/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinx-autobuild/sphinx-autobuild-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/sphinx-1.7.5[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
}
        