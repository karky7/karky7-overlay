# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI=6
PYTHON_COMPAT=( python{2_7,3_{3,4,5,6}} )

inherit eutils multilib distutils-r1

DESCRIPTION="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
HOMEPAGE="https://pypi.org/project/sphinx-autobuild/"
SRC_URI="https://pypi.python.org/packages/source/s/sphinx-autobuild/sphinx-autobuild-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-python/sphinx"
RDEPEND="${DEPEND}"
