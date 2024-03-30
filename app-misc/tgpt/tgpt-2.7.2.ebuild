# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="AI Chatbots in terminal without needing API keys"
HOMEPAGE="https://github.com/aandrew-me/tgpt"
SRC_URI="https://github.com/aandrew-me/tgpt/archive/refs/tags/v${PV}.zip
https://github.com/rphii/gentoo-tpgt-deps/releases/download/v${PV}/tgpt-${PV}-deps.tar.gz
"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

inherit go-module

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#S="${WORKDIR}/${PN}-v${PV}"

src_compile() {
	ego build -trimpath -ldflags="-s -w" -o tgpt || die "build failed"
}

src_install() {
	#mv "${D}/tgpt-2.7.2" "${D}/tgpt"
	dobin tgpt
	echo "installed tgpt"
}

