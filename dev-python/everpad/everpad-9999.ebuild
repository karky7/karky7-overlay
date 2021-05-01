# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 git-r3 eutils

EGIT_REPO_URI="git://github.com/nvbn/everpad.git"
EGIT_MASTER="develop"

DESCRIPTION="Evernote client well integrated with linux desktop"
HOMEPAGE="https://github.com/nvbn/everpad"
SRC_URI=""

LICENSE="X11"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
		dev-python/beautifulsoup
		dev-python/html2text
		dev-python/httplib2
		dev-python/keyring
		dev-python/oauth2
		dev-python/regex
		dev-python/sqlalchemy
		dev-python/dbus-python
		dev-python/setuptools
		dev-python/pyside[webkit]
	sys-apps/file[python]
		"

python_test() {
		esetup.py test
}

src_prepare() {
		distutils_src_prepare
		epatch "${FILESDIR}/${P}-content.py.patch"
	epatch "${FILESDIR}/${P}-everpad.desktop.patch"
}

python_install() {
	distutils_src_install
		delete_tests() {
				rm -fr "${ED}$(python_get_sitedir)/everpad/tests"
		}
		python_execute_function -q delete_tests
}
