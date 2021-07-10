# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION=" A robust email syntax and deliverability validation library for Python 3.x."
HOMEPAGE="https://github.com/JoshData/python-email-validator"
SRC_URI="https://pypi.python.org/packages/source/e/email-validator/email_validator-${PV}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/dnspython-1.15.0
>=dev-python/idna-2.0.0"
RDEPEND="${DEPEND}"
