# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit multilib distutils-r1

DESCRIPTION="Correctly generate plurals, singular nouns, ordinals, indefinite articles; convert numbers to words"
HOMEPAGE="https://pypi.python.org/pypi/inflect"
SRC_URI="https://pypi.python.org/packages/source/i/inflect/inflect-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
