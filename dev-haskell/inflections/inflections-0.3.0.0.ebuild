# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Inflections library for Haskell"
HOMEPAGE="https://github.com/stackbuilders/inflections-hs"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/exceptions-0.6:=[profile?] <dev-haskell/exceptions-0.9:=[profile?]
	>=dev-haskell/megaparsec-5.0:=[profile?] <dev-haskell/megaparsec-6.0:=[profile?]
	>=dev-haskell/text-0.2:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/unordered-containers-0.2.7:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	test? ( >=dev-haskell/hspec-2.0 <dev-haskell/hspec-3.0
		>=dev-haskell/hspec-megaparsec-0.3 <dev-haskell/hspec-megaparsec-0.4
		>=dev-haskell/megaparsec-5.1 <dev-haskell/megaparsec-6.0
		>=dev-haskell/quickcheck-2.7.6 <dev-haskell/quickcheck-3.0 )
"
