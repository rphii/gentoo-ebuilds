# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Zoomer application for Wayland inspired by tsoding's boomer"
URL="https://github.com/coffeeispower/woomer.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3 cargo

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-build/cmake
	|| ( dev-lang/rust-bin dev-lang/rust )
	dev-util/pkgconf
	llvm-core/clang
"

# wayland cliend
# libclang ?

RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
	dobin "$(cargo_target_dir)"/woomer
#	doman doc/generated/*.1
#
#	dodoc README.md CHANGELOG.md
#	newbashcomp completions/swww.bash swww
#	dofishcomp completions/swww.fish
#	dozshcomp completions/_swww
}

