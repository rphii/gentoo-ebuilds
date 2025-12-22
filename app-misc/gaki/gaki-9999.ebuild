# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="simple directory explorer"
URL="https://github.com/rphii/gaki"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3 meson

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-build/meson
	dev-libs/rltui
	dev-libs/rlpw
	dev-libs/rlso
	dev-libs/rlc
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
