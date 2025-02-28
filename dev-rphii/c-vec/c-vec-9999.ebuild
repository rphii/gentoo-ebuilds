# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Generic compile-time C vector"
URL="https://github.com/rphii/c-vec.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-err
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/rphii
	doins src/vec.h

	insinto /usr/$(get_libdir)/pkgconfig
	doins c-vec.pc
}

