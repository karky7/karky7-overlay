# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="simple-db-migrate is a database versioning and migration tool"
HOMEPAGE="http://guilhermechapiewski.github.io/simple-db-migrate/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	eapply_user
	# error for `Package installs 'tests' package which is forbidden and likely a bug in the build system.`
	rm -r tests/
}

PATCHES=(
	"${FILESDIR}/${PN}-3.0.2-mssql.patch"
)
