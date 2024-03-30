# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple and easy-to-use library to enjoy videogames programming"
HOMEPAGE="www.raylib.com"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="+png +gui"

DEPEND="
	dev-raylib/rcore
	png? ( dev-raylib/rpng )
	gui? ( dev-raylib/raygui )
"
RDEPEND="${DEPEND}"
BDEPEND=""
