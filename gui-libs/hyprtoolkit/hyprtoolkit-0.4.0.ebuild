# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="guiutils"
HOMEPAGE="github/hyprwm"
SRC_URI="https://github.com/hyprwm/hyprtoolkit/archive/refs/tags/v${PV}.tar.gz -> ${PF}.tar.gz"

inherit cmake

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/hyprgraphics-0.3.0
	>=gui-libs/aquamarine-0.9.5
	dev-libs/iniparser
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

