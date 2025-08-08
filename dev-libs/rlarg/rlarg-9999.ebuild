# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Argument parser for C."
URL="https://github.com/rphii/rlarg"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3 meson

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-build/meson
	dev-libs/rlc
	dev-libs/rlso
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	#local emesonargs=(
	#	$(meson_feature test tests)
	#)

	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_install
}

src_test() {
	meson_src_test --no-suite syntax-check
}
