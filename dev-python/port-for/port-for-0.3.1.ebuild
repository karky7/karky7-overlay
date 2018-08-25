# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


EAPI=6
PYTHON_COMPAT=( python{2_7,3_{3,4,5,6}} )

inherit eutils multilib distutils-r1

DESCRIPTION="port-for is a command-line utility and a python library that helps with local TCP ports management."
HOMEPAGE="https://pypi.org/project/port-for/"
SRC_URI="https://pypi.python.org/packages/source/p/port-for/port-for-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc =x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
