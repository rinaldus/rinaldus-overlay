# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit git-r3 gnome2-utils eutils distutils-r1

DESCRIPTION="DockBarX is a lightweight taskbar / panel replacement for Linux"
HOMEPAGE="https://github.com/M7S/dockbarx"
EGIT_REPO_URI="https://github.com/M7S/${PN}.git"

LICENSE="GPL3"
SLOT="0"
KEYWORDS=""
IUSE="dockmanager"

DEPEND="dev-python/pygobject
	dev-python/pygtk
	dev-python/gconf-python
	dev-python/pillow
	dev-python/libwnck-python
	dev-libs/keybinder[python]
	dev-python/pyxdg
	dev-python/python-xlib
	=x11-libs/libwnck-2.31.0
	dockmanager? ( x11-misc/dockmanager )"
RDEPEND="${DEPEND}"

pkg_postinst() { gtk-update-icon-cache; gnome2_icon_cache_update; }
pkg_postrm() { gtk-update-icon-cache; gnome2_icon_cache_update; }
