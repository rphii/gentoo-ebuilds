# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A simple and easy-to-use library to enjoy videogames programming"
HOMEPAGE="www.raylib.com"
SRC_URI="https://github.com/raysan5/raylib/archive/refs/tags/${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

#S="${WORKDIR}/${PN}-${P}"

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



# *   DEPENDENCIES (included):
# *       [rcore] rglfw (Camilla Löwy - github.com/glfw/glfw) for window/context management and input (PLATFORM_DESKTOP)
# *       [rlgl] glad (David Herberth - github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading (PLATFORM_DESKTOP)
# *       [raudio] miniaudio (David Reid - github.com/mackron/miniaudio) for audio device/context management
# *
# *   OPTIONAL DEPENDENCIES (included):
# *       [rcore] msf_gif (Miles Fogle) for GIF recording
# *       [rcore] sinfl (Micha Mettke) for DEFLATE decompression algorithm
# *       [rcore] sdefl (Micha Mettke) for DEFLATE compression algorithm
# *       [rtextures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
# *       [rtextures] stb_image_write (Sean Barret) for image writing (BMP, TGA, PNG, JPG)
# *       [rtextures] stb_image_resize (Sean Barret) for image resizing algorithms
# *       [rtext] stb_truetype (Sean Barret) for ttf fonts loading
# *       [rtext] stb_rect_pack (Sean Barret) for rectangles packing
# *       [rmodels] par_shapes (Philip Rideout) for parametric 3d shapes generation
# *       [rmodels] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
# *       [rmodels] cgltf (Johannes Kuhlmann) for models loading (glTF)
# *       [rmodels] Model3D (bzt) for models loading (M3D, https://bztsrc.gitlab.io/model3d)
# *       [raudio] dr_wav (David Reid) for WAV audio file loading
# *       [raudio] dr_flac (David Reid) for FLAC audio file loading
# *       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
# *       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
# *       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
# *       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading

src_install() {
	doheader {raylib,raymath,rlgl}.h
	use shared-libs && dolib.so libraylib.so*
	use static-libs && dolib.a libraylib.a*
	use examples && dodoc -r ../examples
	dodoc ../{BINDINGS,CONVENTIONS,FAQ,HISTORY,README,ROADMAP}.md
}

