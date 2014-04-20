# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="A uTorrent-like frontend for Transmission daemon"
HOMEPAGE="http://code.google.com/p/transmisson-remote-gui/"
SRC_URI="http://transmisson-remote-gui.googlecode.com/files/${P}-src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RESTRICT="mirror strip"

RDEPEND=">=sys-libs/glibc-2.11.0
		>=x11-libs/gtk+-2.20.0
		>=x11-libs/pango-1.28.0"
DEPEND="${RDEPEND}
		>=dev-lang/lazarus-0.9.30
		>=dev-lang/fpc-2.4.4
		app-arch/unzip"

S="${WORKDIR}/TransGUI"

src_install() {
	emake PREFIX="${D}/usr" install || die "emake install failed"

	make_desktop_entry transgui "Transmission remote GUI" ${PN} \
		"Network;FileTransfer;P2P"
	doicon transgui.png
	dodoc history.txt readme.txt LICENSE.txt
}
