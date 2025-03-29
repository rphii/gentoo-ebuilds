# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="A lightweight image viewer written entirely in C"
URL="https://github.com/rphii/c-image-viewer.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3 meson

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/pkgconf
	dev-libs/cglm
	dev-build/make
	sys-libs/glibc
	virtual/opengl
	media-libs/glfw
	media-libs/freetype
	dev-libs/stb
	dev-libs/rphiic
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_install
}

