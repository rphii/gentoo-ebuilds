# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="C file library"
URL="https://github.com/rphii/c-file.git"
HOMEPAGE="${URL}"
EGIT_REPO_URI="${URL}"

inherit toolchain-funcs git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-colorprint
	dev-rphii/c-err
	dev-rphii/c-vec
	dev-rphii/c-str
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	CC="$(tc-getCC)" ./compile.sh
	if [[ $? -ne 0 ]]; then
        die "Installation script failed with exit status $?"
    fi
}

src_install() {
	insinto /usr/include/rphii
	doins src/*.h

	insinto /usr/lib/rphii
	doins build/32/libfile.so

	insinto /usr/lib64/rphii
	doins build/64/libfile.so

	insinto /usr/$(get_libdir)/pkgconfig
	doins c-file.pc
}

