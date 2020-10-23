# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/imaging/imaging-1.1.7-r2.ebuild,v 1.4 2013/02/24 12:15:03 ago Exp $

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit eutils multilib distutils-r1

DESCRIPTION="Correctly generate plurals, singular nouns, ordinals, indefinite articles; convert numbers to words"
HOMEPAGE="https://pypi.python.org/pypi/inflect"
SRC_URI="https://pypi.python.org/packages/source/i/inflect/inflect-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
