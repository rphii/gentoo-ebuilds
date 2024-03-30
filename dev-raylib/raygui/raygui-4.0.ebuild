# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple and easy-to-use immediate-mode gui library "
HOMEPAGE="https://www.raylib.com/"
SRC_URI="https://github.com/raysan5/raygui/archive/refs/tags/${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="examples"

S="${WORKDIR}/raygui-${PV}/src"

src_install() {
	doheader raygui.h
}

