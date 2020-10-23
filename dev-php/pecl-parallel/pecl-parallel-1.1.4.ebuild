# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PHP_EXT_NAME="parallel"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS=( README.md )

USE_PHP="php7-2 php7-3 php7-4"

inherit php-ext-pecl-r3

KEYWORDS="amd64 ia64 x86"
LICENSE="PHP-3.01"

DESCRIPTION=""
SLOT="0"

DEPEND="
	php_targets_php7-2? ( dev-lang/php:7.2[threads?] )
	php_targets_php7-3? ( dev-lang/php:7.3[threads?] )
	php_targets_php7-4? ( dev-lang/php:7.4[threads?] )"

RDEPEND="
	${DEPEND}"

IUSE="examples coverage dev +threads"

src_configure() {
	local PHP_EXT_ECONF_ARGS=(
        --enable-parallel
		$(use_enable coverage parallel-coverage)
		$(use_enable dev parallel-dev)
	)
	php-ext-source-r3_src_configure
}
