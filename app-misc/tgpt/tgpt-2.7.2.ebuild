# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="AI Chatbots in terminal without needing API keys"
HOMEPAGE="https://github.com/aandrew-me/tgpt"
SRC_URI="https://github.com/aandrew-me/tgpt/archive/refs/tags/v2.7.2.zip"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	./build.sh <<< "1" || die "failed building"
}

src_install() {
	mv build/tgpt* build/tgpt
	dobin build/tgpt
	echo "installed tgpt"
}

