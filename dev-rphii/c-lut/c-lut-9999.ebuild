# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Generic compile-time C lookup table"
URL="https://github.com/rphii/c-lut.git"
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
	doins src/*.h
}

