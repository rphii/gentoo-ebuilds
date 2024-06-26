# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="AI Chatbots in terminal without needing API keys"
HOMEPAGE="https://github.com/aandrew-me/tgpt"
SRC_URI="https://github.com/aandrew-me/tgpt/archive/refs/tags/v${PV}.zip
	https://github.com/rphii/gentoo-tgpt-deps/releases/download/v${PV}/tgpt-${PV}-deps.tar.gz
"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

inherit go-module

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	case "$ARCH" in
		amd64|x86|arm64) export GOARCH="$ARCH" ;;
		*) die "architecture $ARCH is not supported" ;;
	esac
	ego build -trimpath -ldflags="-s -w" -o tgpt || die "build failed"
}

src_install() {
	dobin tgpt
	echo "installed tgpt"
}

