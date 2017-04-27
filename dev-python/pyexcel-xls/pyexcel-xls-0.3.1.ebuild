# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{3,4,5,6}} )

inherit eutils multilib distutils-r1

DESCRIPTION="It reads xlsx and xlsm format for python"
HOMEPAGE="https://pypi.python.org/pypi/pyexcel-xls/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="dev-python/pyexcel-io
dev-python/xlrd
dev-python/xlwt"
RDEPEND="${DEPEND}"
