# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="port-for is a command-line utility and a python library that helps with local TCP ports management."
HOMEPAGE="https://pypi.org/project/port-for/"
SRC_URI="https://pypi.python.org/packages/source/p/port-for/port-for-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
