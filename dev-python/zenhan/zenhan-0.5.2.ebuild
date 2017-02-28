# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4} )

inherit eutils multilib distutils-r1

DESCRIPTION="Converter between Full-width Japanese and Half-width Japanese"
HOMEPAGE="https://github.com/sspiral/zenhan-py"
SRC_URI="http://pypi.python.org/packages/source/z/zenhan/zenhan-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
