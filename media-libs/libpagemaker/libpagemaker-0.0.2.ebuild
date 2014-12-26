# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://gerrit.libreoffice.org/${PN}.git"
inherit autotools eutils
[[ ${PV} == 9999 ]] && inherit git-2

DESCRIPTION="C++ Library that parses the file format of Aldus/Adobe PageMaker documents."
HOMEPAGE="https://wiki.documentfoundation.org/DLP/Libraries/${PN}"
[[ ${PV} == 9999 ]] || SRC_URI="http://dev-www.libreoffice.org/src/${PN}/${P}.tar.xz"

LICENSE="MPL-2.0"
SLOT="0"
[[ ${PV} == 9999 ]] || \
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug doc tools"

RDEPEND="dev-libs/librevenge"

DEPEND="${RDEPEND}
	>=dev-libs/boost-1.47
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

src_prepare() {
	# fix Oops (commit 585b795c1431fd42d29391d1932bb6745edc2eb1)
	# remove in >=0.0.3
	sed \
		-e "s:no-undefines:no-undefined:g" \
		-i src/lib/Makefile.am || die

    einfo "Regenerating autotools files..."
    eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		--disable-werror \
		$(use_enable tools) \
		$(use_with doc docs)
}

src_install() {
	default
	prune_libtool_files --all
}
