# Copyright owners: Gentoo Foundation
#                   Arfrever Frehtes Taifersar Arahesis
#                   madsl
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="DB-API interface to Microsoft SQL Server for Python"
HOMEPAGE="http://pymssql.org/ https://github.com/pymssql/pymssql https://pypi.python.org/pypi/pymssql"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=">=dev-db/freetds-1.0.0[mssql]
	virtual/krb5
	dev-python/wheel[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]"

python_compile() {
	distutils-r1_python_compile
}

src_prepare() {
	distutils-r1_src_prepare
}
