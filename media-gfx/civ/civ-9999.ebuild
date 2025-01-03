# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lightweight image viewer written entirely in C"
HOMEPAGE="https://github.com/rphii/c-image-viewer"
SRC_URI="https://github.com/rphii/c-image-viewer"

EGIT_REPO_URI="https://github.com/rphii/c-image-viewer"

inherit git-r3
inherit ninja-utils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/cglm
	dev-build/ninja
	sys-libs/glibc
	virtual/opengl
	media-libs/freetype
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

