# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Integrated set of Django applications addressing authentication"
HOMEPAGE="https://badge.fury.io/py/django-allauth"
SRC_URI="https://pypi.python.org/packages/source/d/django-allauth/django-allauth-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
