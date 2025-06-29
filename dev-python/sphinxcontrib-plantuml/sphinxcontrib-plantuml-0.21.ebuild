# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} pypy3_11 )

inherit distutils-r1

DESCRIPTION="PlantUML for Sphinx."
HOMEPAGE="https://github.com/sphinx-contrib/plantuml/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinxcontrib-plantuml/sphinxcontrib-plantuml-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ppc ppc64 ~riscv ~s390 sparc x86 ~x64-macos"
IUSE=""

PDEPEND="dev-python/sphinx[${PYTHON_USEDEP}]"
RDEPEND="media-gfx/plantuml
dev-python/docutils[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		${PDEPEND}
		dev-python/readthedocs-sphinx-ext[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
