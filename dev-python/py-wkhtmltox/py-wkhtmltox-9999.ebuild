# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/py-wkhtmltox/py-wkhtmltox-9999.ebuild,v 1.4 2013/02/24 12:15:03 ago Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils multilib distutils-r1 git-2

DESCRIPTION="Python bindings for the fabulous libwkhtmltox using Cython"
HOMEPAGE="https://github.com/mreiferson/py-wkhtmltox"
EGIT_REPO_URI="https://github.com/karky7/py-wkhtmltox.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="media-gfx/wkhtmltopdf"
RDEPEND="${DEPEND}"
