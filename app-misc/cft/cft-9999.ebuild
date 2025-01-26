# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple CLI tool to store, systematically retrieve and manage tags of anything"
HOMEPAGE="https://github.com/rphii/c-file-tagger"
SRC_URI="https://github.com/rphii/c-file-tagger"

EGIT_REPO_URI="https://github.com/rphii/c-file-tagger"

inherit git-r3 ninja-utils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake -C src DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}

