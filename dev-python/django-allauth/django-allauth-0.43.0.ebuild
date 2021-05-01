# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Integrated set of Django applications addressing authentication"
HOMEPAGE="https://badge.fury.io/py/django-allauth"
SRC_URI="https://pypi.python.org/packages/source/d/django-allauth/django-allauth-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
