# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit eutils multilib distutils-r1

DESCRIPTION="Correctly generate plurals, singular nouns, ordinals, indefinite articles; convert numbers to words"
HOMEPAGE="https://pypi.python.org/pypi/inflect"
SRC_URI="https://pypi.python.org/packages/source/i/inflect/inflect-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
