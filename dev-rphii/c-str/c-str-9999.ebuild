# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="C string library"
URL="https://github.com/rphii/c-str"
HOMEPAGE="${URL}"
SRC_URI="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-colorprint
	dev-rphii/c-err
	dev-rphii/c-vec
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	./install.sh
}

