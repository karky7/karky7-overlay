# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit eutils multilib distutils-r1

DESCRIPTION="PlantUML for Sphinx."
HOMEPAGE="https://github.com/sphinx-contrib/plantuml/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinxcontrib-plantuml/sphinxcontrib-plantuml-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-python/sphinx
media-gfx/plantuml"

RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
