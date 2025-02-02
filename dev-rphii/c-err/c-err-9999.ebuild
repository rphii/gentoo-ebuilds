# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Error handling for C"
URL="https://github.com/rphii/c-err"
HOMEPAGE="${URL}"
SRC_URI="${URL}"
EGIT_REPO_URI="${URL}"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-rphii/c-colorprint
	dev-rphii/c-attr
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		pushd "${P}" >/dev/null || die
		git-r3_fetch "${EGIT_REPO_URI}"
		#git-r3_checkout "${EGIT_REPO_URI}" main
		popd >/dev/null || die
	elif use verify-sig; then
		verify-sig_verify_detached "${DISTDIR}"/${P}.tar.xz{,.sig}
	fi
	default
}

src_install() {
	insinto /usr/include/rphii
	doins src/err.h
}

