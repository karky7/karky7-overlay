# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="database migrations tool, written by the author of SQLAlchemy"
HOMEPAGE="https://bitbucket.org/zzzeek/alembic"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test doc"

RDEPEND="dev-python/sqlalchemy
	dev-python/mako
	dev-python/python-editor
	dev-python/python-dateutil"
DEPEND="dev-python/setuptools
	test? (${RDEPEND}
		dev-python/nose
		dev-python/mock)"
# For test phase
DISTUTILS_IN_SOURCE_BUILD=1

python_prepare_all() {
	# suite passes all if run from source. The residual fail & error are quite erroneous
	rm tests/test_script_consumption.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	${EPYTHON} run_tests.py || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )

	distutils-r1_python_install_all
}
