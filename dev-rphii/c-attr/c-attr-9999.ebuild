# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Very simple macro to use basic colors"
URL="https://github.com/rphii/c-attr.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-platform-detect
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/rphii
	doins src/attr.h

	insinto /usr/$(get_libdir)/pkgconfig
	doins c-attr.pc
}

