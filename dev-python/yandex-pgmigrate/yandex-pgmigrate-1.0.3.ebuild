# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit eutils distutils-r1

DESCRIPTION="PostgreSQL migrations made easy"
HOMEPAGE="https://github.com/yandex/pgmigrate/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="POSTGRESQL GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/python-sqlparse[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/psycopg[${PYTHON_USEDEP}]"

# PATCHES=("${FILESDIR}"/${P}.patch)
