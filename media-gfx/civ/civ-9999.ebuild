# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="A lightweight image viewer written entirely in C"
URL="https://github.com/rphii/c-image-viewer.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3 ninja-utils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/cglm
	dev-build/ninja
	sys-libs/glibc
	virtual/opengl
	media-libs/glfw
	media-libs/freetype
	dev-rphii/c-file
	dev-rphii/c-str
	dev-rphii/c-lut
	dev-rphii/c-utf8
"
RDEPEND="${DEPEND}"
BDEPEND=""

DESTDIR="/opt/${PN}"

src_compile() {
	eninja -C src
}

src_install() {
	exeinto "${DESTDIR}"
	doexe "src/${PN}.out"

	insinto "${DESTDIR}"
	doins -r src/shaders

	dosym "/opt/${PN}/${PN}.out" "/bin/${PN}"
}

