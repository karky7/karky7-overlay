# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit eutils distutils-r1

DESCRIPTION="simple-db-migrate is a database versioning and migration tool"
HOMEPAGE="http://guilhermechapiewski.github.io/simple-db-migrate/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	eapply_user
	# error for `Package installs 'tests' package which is forbidden and likely a bug in the build system.`
	rm -r tests/
}
