# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple and easy-to-use library to manage png chunks"
HOMEPAGE="https://www.raylib.com/"
SRC_URI="https://github.com/raysan5/rpng/archive/refs/tags/1.0.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="examples"

S="${WORKDIR}/rpng-${PV}/src"

src_install() {
	doheader rpng.h
}

