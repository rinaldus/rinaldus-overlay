# Copyright 2016 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_URI="github/lxde"

inherit cmake-utils

SRC_URI="https://github.com/lxde/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

DESCRIPTION="Qt port of pavucontrol"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64 ~arm"
IUSE="doc"

CDEPEND="
	dev-libs/glib:2
	lxqt-base/liblxqt
	media-sound/pulseaudio[glib]
	dev-qt/qtdbus:5
	dev-qt/qtwidgets:5"
DEPEND="${CDEPEND}
	dev-qt/linguist-tools:5
	virtual/pkgconfig
	x11-misc/xdg-user-dirs"
RDEPEND="${CDEPEND}"

src_configure() {
	cmake-utils_src_configure
}
