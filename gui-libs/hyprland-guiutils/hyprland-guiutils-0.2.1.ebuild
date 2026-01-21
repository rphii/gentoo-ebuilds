# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hyprland GUI utilities (successor to hyprland-qtutils) "
HOMEPAGE="https://github.com/hyprwm/hyprland-guiutils"
SRC_URI="https://github.com/hyprwm/hyprland-guiutils/archive/refs/tags/v${PV}.tar.gz -> ${PF}.tar.gz"

inherit cmake

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=gui-libs/hyprtoolkit-0.4.0
	>=gui-libs/hyprutils-0.10.2
	>=dev-libs/hyprlang-0.6.0
"
RDEPEND="${DEPEND}"
BDEPEND=""

