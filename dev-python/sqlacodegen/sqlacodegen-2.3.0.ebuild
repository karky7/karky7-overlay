# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="Automatic model code generator for SQLAlchemy"
HOMEPAGE="https://pypi.python.org/pypi/sqlacodegen"
SRC_URI="https://pypi.python.org/packages/source/s/sqlacodegen/sqlacodegen-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

DEPEND="dev-python/sqlalchemy[${PYTHON_USEDEP}]
dev-python/inflect[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
