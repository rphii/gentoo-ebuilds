# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A simple and easy-to-use immediate-mode gui library "
HOMEPAGE="https://www.raylib.com/"
SRC_URI="https://github.com/raysan5/raygui/archive/refs/tags/${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-raylib/rcore"
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="examples +static-libs shared-libs"

S="${WORKDIR}/raygui-${PV}/src"

src_prepare() {
	cp raygui.h raygui.c
	eapply_user
}

src_compile() {
	CC="$(tc-getCC)"
	AR="$(tc-getAR)"
	LDFLAGS="-fpic -DRAYGUI_IMPLEMENTATION -lraylib -lGL -lm -lpthread -ldl -lrt -lX11"
	use shared-libs && ${CC} -o raygui.so ${CFLAGS} raygui.c ${LDFLAGS} -shared
	if use static-libs; then
		${CC} -c raygui.o ${CFLAGS} raygui.c ${LDFLAGS} -static
		${AR} rcs raygui.a raygui.o
	fi
}

src_install() {
	use shared-libs && dolib.so raygui.so
	use static-libs && dolib.a raygui.a
	doheader raygui.h
	use examples && dodoc -r ../examples
}

