# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-wkhtmltox/pecl-wkhtmltox-9999.ebuild,v 1.3 2013/09/16 11:19:38 olemarkus Exp $

EAPI=5

inherit php-ext-pecl-r2 git-2

PHP_EXT_NAME="php-wkhtmltox"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="yes"
DOCS=""
KEYWORDS="amd64 x86"

SRC_URI=""
EGIT_REPO_URI="https://github.com/mreiferson/php-wkhtmltox.git"
HOMEPAGE="https://github.com/mreiferson/php-wkhtmltox"
DESCRIPTION="PHP bindings for the fabulous libwkhtmltox"
LICENSE="PHP-3.01"
SLOT="0"
USE_PHP="php5-3 php5-4"
IUSE="php_targets_php5-3 php_targets_php5-4"

DEPEND="media-gfx/wkhtmltopdf"
RDEPEND="${DEPEND}"

MY_PV="${PV/_/}"
MY_PV="${MY_PV/rc/RC}"
PECL_PKG_V="${PECL_PKG}-${MY_PV}"
S="${WORKDIR}/${PECL_PKG_V}"
