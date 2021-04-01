# Copyright 2018-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="PlantUML for Sphinx."
HOMEPAGE="https://github.com/sphinx-contrib/plantuml/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinxcontrib-plantuml/sphinxcontrib-plantuml-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

DEPEND="dev-python/sphinx
media-gfx/plantuml"

RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
