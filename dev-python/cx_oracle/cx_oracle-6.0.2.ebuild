# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4} )

inherit eutils multilib distutils-r1

MY_PN="cx_Oracle"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python extension module that allows access to Oracle Databases"
HOMEPAGE="https://oracle.github.io/python-cx_Oracle"
# SRC_URI="mirror://pypi/${PY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SRC_URI="mirror://pypi/c/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="test doc"

DEPEND=">=dev-db/oracle-instantclient-basic-10.2.0.3"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_P}"
