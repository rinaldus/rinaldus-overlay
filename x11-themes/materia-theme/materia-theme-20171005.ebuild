# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="A Material Design-like flat theme for GTK3, GTK2 and GNOME Shell"
HOMEPAGE="https://github.com/nana-4/materia-theme"

if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~*"
	S="${WORKDIR}/${PN}-${PV}"
	RESTRICT="mirror"
fi

LICENSE="LGPL-3.0"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/gtk+:2
	>=x11-libs/gtk+-3.18:3
	>=x11-themes/gnome-themes-standard-3.18
	x11-libs/gdk-pixbuf
	x11-themes/gtk-engines-murrine
	dev-libs/glib
"
RDEPEND="${DEPEND}"

src_install(){
	destdir="${D}" ./install.sh || die "failed to install"
}
