# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PHP_EXT_NAME="phpwkhtmltox"
PHP_EXT_INI="yes"
USE_PHP="php7-2 php7-3 php7-4"

inherit php-ext-source-r3 git-r3

DESCRIPTION="PHP bindings for the fabulous libwkhtmltox"
HOMEPAGE="https://github.com/mreiferson/php-wkhtmltox"
EGIT_REPO_URI="https://github.com/karky7/php-wkhtmltox.git"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-gfx/wkhtmltopdf"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	# create the default modules directory to be able
	# to use the php-ext-source-r3 eclass to configure/build
	for slot in $(php_get_slots); do
		cp -r "${S}" "${WORKDIR}/${slot}"
	done
}

src_install() {
	for slot in $(php_get_slots); do
		php_init_slot_env ${slot}
		insinto "${EXT_DIR}"
		newins "modules/${PHP_EXT_NAME}.so" "${PHP_EXT_NAME}.so"
	done
	php-ext-source-r3_createinifiles
}
