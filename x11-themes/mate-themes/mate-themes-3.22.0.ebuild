# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_GTK_V="$(get_version_component_range 1-2)"
MATE_GTK_NV="3.$(( $(get_version_component_range 2-2) + 1 ))" #variable to allow negation of =$P-1*

SRC_URI="http://pub.mate-desktop.org/releases/themes/${MATE_GTK_V}/${P}.tar.xz"
DESCRIPTION="A set of MATE themes, with sets for users with limited or low vision"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2.1"
SLOT="0/${MATE_GTK_V}"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="
	>=x11-libs/gdk-pixbuf-2:2
	>=x11-libs/gtk+-2:2
	!<x11-libs/gtk+-${MATE_GTK_V}:3
	!>=x11-libs/gtk+-${MATE_GTK_NV}:3
	>=x11-themes/gtk-engines-2.15.3:2
	x11-themes/gtk-engines-murrine"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35:*
	sys-devel/gettext:*
	>=sys-devel/autoconf-2.53:*
	>=x11-misc/icon-naming-utils-0.8.7:0
	virtual/pkgconfig:*"

RESTRICT="binchecks strip"
DOCS="AUTHORS ChangeLog NEWS README"
