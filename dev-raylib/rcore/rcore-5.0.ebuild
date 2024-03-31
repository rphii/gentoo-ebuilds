# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple and easy-to-use library to enjoy videogames programming"
HOMEPAGE="www.raylib.com"
SRC_URI="https://github.com/raysan5/raylib/archive/refs/tags/${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

# DEPENDENCIES
# fedora :
##	alsa-lib-devel
##	mesa-libGL-devel
## 	libX11-devel
##	libXrandr-devel
##	libXi-devel
##	libXcursor-devel
##	libXinerama-devel
##	libatomic
# arch   :
##	alsa-lib
##	mesa
##	libx11
##	libxrandr
##	libxi
##	libxcursor
##	libxinerama
# wayland: sudo dnf install
# 	wayland-devel
# 	libxkbcommon-devel
# 	wayland-protocols-devel


IUSE="wayland +static-libs shared-libs web-libs examples"

REQUIRED_USE="
	^^ ( static-libs shared-libs web-libs )
"

DEPEND="
	media-libs/alsa-lib
	media-libs/mesa
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXi
	x11-libs/libXcursor
	x11-libs/libXinerama
	dev-libs/libatomic_ops
	wayland? (
		dev-libs/wayland
		dev-libs/wayland-protocols
		x11-libs/libxkbcommon
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/raylib-${PV}/src"

src_compile() {
	# library
	platform="PLATFORM="
	libtype="RAYLIB_LIBTYPE="
	if use shared-libs ; then
		platform+="PLATFORM_DESKTOP"
		libtype+="SHARED"
	elif use static-libs ; then
		platform+="PLATFORM_DESKTOP"
		libtype+="STATIC"
	elif use web-libs ; then
		platform+="PLATFORM_WEB"
	else
		die "library type not specified"
	fi
	if use wayland ; then
		CFLAGS+=" -DUSE_WAYLAND_DISPLAY=TRUE"
	fi
	emake ${platform} ${libtype}
}

#   raylib makefile
#
#   This file supports building raylib library for the following platforms:
#
#     > PLATFORM_DESKTOP (GLFW backend):
#         - Windows (Win32, Win64)
#         - Linux (X11/Wayland desktop mode)
#         - macOS/OSX (x64, arm64)
#         - FreeBSD, OpenBSD, NetBSD, DragonFly (X11 desktop)
#     > PLATFORM_DESKTOP_SDL (SDL backend):
#         - Windows (Win32, Win64)
#         - Linux (X11/Wayland desktop mode)
#         - Others (not tested)
#     > PLATFORM_WEB:
#         - HTML5 (WebAssembly)
#     > PLATFORM_DRM:
#         - Raspberry Pi 0-5 (DRM/KMS)
#         - Linux DRM subsystem (KMS mode)
#     > PLATFORM_ANDROID:
#         - Android (ARM, ARM64)
 
src_install() {
	# install headers + source files into 'usr/include/raylib'
	# I know I probably shouldn't install .h AND .c files under /usr/include, but the nature
	# of raylib almost forces me to (at least) install both 'concepts'. if they're in the
	# same place, everything gets easier so that we can inspect any file at any time and 
	# potentially inspire and alter our code from there
	mkdir ${T}/raylib
	find -type f \( -name "*.h" -o -name "*.c" \) -exec cp --parents \{\} ${T}/raylib \;
	doheader -r ${T}/raylib
	# install library
	use shared-libs && dolib.so libraylib.so*
	use static-libs && dolib.a libraylib.a*
	use examples && dodoc -r ../examples
	# documentation
	dodoc ../{BINDINGS,CONVENTIONS,FAQ,HISTORY,README,ROADMAP}.md
}

