# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Utility functions for utf-8"
URL="https://github.com/rphii/c-utf8.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-err
	dev-rphii/c-str
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/rphii
	doins src/*.h
}

