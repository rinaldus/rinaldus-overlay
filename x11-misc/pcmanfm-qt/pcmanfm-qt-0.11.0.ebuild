# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils multilib readme.gentoo

#if [[ "${PV}" == "9999" ]]; then
#	inherit git-r3
#	EGIT_REPO_URI="git://git.lxde.org/git/lxde/${PN}"
#else
	SRC_URI="https://github.com/lxde/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
#fi

DESCRIPTION="Fast lightweight tabbed filemanager (Qt port)"
HOMEPAGE="http://pcmanfm.sourceforge.net/"

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"
S="${WORKDIR}/${PN}-${PV}"

CDEPEND=">=dev-libs/glib-2.18:2
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	>=lxde-base/menu-cache-0.4.1
	>=x11-libs/libfm-1.2.0
	x11-libs/libfm-qt
	x11-libs/libxcb:=
"
RDEPEND="${CDEPEND}
	x11-misc/xdg-utils
	virtual/eject
	virtual/freedesktop-icon-theme"
DEPEND="${CDEPEND}
	dev-qt/linguist-tools:5
	>=dev-util/intltool-0.40
	sys-devel/gettext
	virtual/pkgconfig"

src_prepare() {
	cmake-utils_src_prepare
}

src_install() {
	cmake-utils_src_install
	DOC_CONTENTS="Be sure to set an icon theme in Edit > Preferences > User Interface"
	readme.gentoo_src_install
}
