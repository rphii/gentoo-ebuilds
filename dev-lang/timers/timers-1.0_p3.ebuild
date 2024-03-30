# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Make use of time functions! | Interpreter for the esoteric programming language"
HOMEPAGE="https://github.com/rphii/TimersInterpreter"
SRC_URI="https://github.com/rphii/TimersInterpreter/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/TimersInterpreter-${PV}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}

