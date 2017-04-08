# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4} )

inherit eutils multilib distutils-r1

MY_PN="cx_Oracle"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python interface to Oracle Database conforming to the Python DB API 2.0 specification."
HOMEPAGE="https://oracle.github.io/python-cx_Oracle"
SRC_URI="mirror://pypi/${PY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
