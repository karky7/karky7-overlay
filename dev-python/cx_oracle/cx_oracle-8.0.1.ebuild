# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils multilib distutils-r1

MY_PN="cx_Oracle"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python extension module that allows access to Oracle Databases"
HOMEPAGE="https://oracle.github.io/python-cx_Oracle"
# SRC_URI="mirror://pypi/${PY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SRC_URI="mirror://pypi/c/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test doc"

DEPEND=">=dev-db/oracle-instantclient-basic-12"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_P}"

src_install() {
	distutils-r1_src_install

	mv "${ED}"/usr/cx_Oracle-doc/ "${ED}"/usr/share/doc/"${P}"/ || die "mv failed"
}
