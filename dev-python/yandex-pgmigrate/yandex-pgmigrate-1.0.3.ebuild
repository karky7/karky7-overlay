# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils distutils-r1

DESCRIPTION="PostgreSQL migrations made easy"
HOMEPAGE="https://github.com/yandex/pgmigrate/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="POSTGRESQL GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/python-sqlparse[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/psycopg[${PYTHON_USEDEP}]"

# PATCHES=("${FILESDIR}"/${P}.patch)
