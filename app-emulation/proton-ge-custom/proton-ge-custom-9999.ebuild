# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Compatibility tool for Steam Play based on Wine and additional components"
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"

#EGIT_COMMIT=""
#EGIT_LFS=1
EGIT_REPO_URI="https://github.com/GloriousEggroll/proton-ge-custom.git"
EGIT_SUBMODULES=( '*' '-glslang' )

inherit git-r3

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-containers/podman
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/0001-custom-flags.patch"
	"${FILESDIR}/0002-vcs_tag.patch"
	"${FILESDIR}/0003-submodule-status.patch"
	)

STEAM_COMPATDIR="${EPREFIX}/usr/share/steam/compatibilitytools.d/"
EBUILD_PROJECT_NAME="GE-Proton${PV}"

src_prepare() {
	default

	pushd openfst
	eapply "${FILESDIR}/0004-dont-use-_pdep_u64.patch"
	popd

	# this is wrong:
	#if [[ $(( $(grep portage /etc/sub{uid,gid} | wc -l) )) != 2 ]]; then
	#	eerror "portage needs to be in subuids and subgids:"
	#	ewarn "$ sudo usermod --add-subuids 10000-75535 portage"
	#	ewarn "$ sudo usermod --add-subgids 10000-75535 portage"
	#	die
	#fi

	./patches/protonprep-valve-staging.sh &> patchlog.txt
	mkdir build || die
}

src_configure() {
	cd build
	# manually run
	if [[ ! -e "Makefile" ]]; then
		ewarn "might have to manually run:"
		ewarn "$ sudo sh -c 'cd $(pwd) && ../configure.sh --build-name=\"${EBUILD_PROJECT_NAME}\" --container-engine=podman'"
		../configure.sh --build-name=\"${EBUILD_PROJECT_NAME}\" --container-engine=podman || die
	fi
}

src_compile() {
	cd build
	# manually run
	if [[ ! -e "${EBUILD_PROJECT_NAME}.tar.gz" ]]; then
		ewarn "might have to manually run: (using ccache)"
		ewarn "$ sudo sh -c 'cd $(pwd) && EBUILD_PROJECT_NAME=${EBUILD_PROJECT_NAME} CCACHE_DIR=/var/cache/ccache make redist'"
		ewarn "might have to manually run: (without ccache)"
		ewarn "$ sudo sh -c 'cd $(pwd) && EBUILD_PROJECT_NAME=${EBUILD_PROJECT_NAME} make redist'"
		make redist || die
	fi
}

src_install() {
	cd build

	insinto "${STEAM_COMPATDIR}"
	doins -r "${EBUILD_PROJECT_NAME}"
}

pkg_postinst() {
	einfo "changing permission of proton executables"
	find  "${STEAM_COMPATDIR}/${EBUILD_PROJECT_NAME}/proton" -exec chmod ugo+x "{}" \;
	find  "${STEAM_COMPATDIR}/${EBUILD_PROJECT_NAME}/files/bin" -type f -exec chmod ugo+x "{}" \;
	find  "${STEAM_COMPATDIR}/${EBUILD_PROJECT_NAME}/protonfixes/winetricks" -exec chmod ugo+x "{}" \;
}

