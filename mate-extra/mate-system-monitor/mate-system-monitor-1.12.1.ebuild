# Copyright open-overlay 2015 by Alex

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="The MATE System Monitor"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3 systemd"

RDEPEND="app-text/rarian:0
	>=dev-cpp/glibmm-2.16:2
	>=dev-libs/dbus-glib-0.70:0
	>=dev-libs/glib-2.28:2
	dev-libs/libsigc++:2
	>=dev-libs/libxml2-2:2
	>=gnome-base/libgtop-2.23.1:2=
	>=gnome-base/librsvg-2.12:2
	>=sys-apps/dbus-0.7:0
	x11-libs/cairo:0
	!gtk3? ( x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-2.20:2
	>=x11-libs/libwnck-2.5:1
	>=dev-cpp/gtkmm-2.22:2.4
        )
        gtk3? ( x11-libs/gtk+:3 
        dev-cpp/gtkmm:3.0
        >=x11-libs/libwnck-3.4:3
        )
        systemd? ( sys-apps/systemd )
	>=x11-themes/mate-icon-theme-1.12:0
	virtual/libintl:0"

DEPEND="${RDEPEND}
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools:0
	>=dev-util/intltool-0.50.2-r1
	sys-devel/gettext:*
	virtual/pkgconfig:*"

DOCS="AUTHORS ChangeLog NEWS README"

src_configure() {
	local myconf

	use gtk3 && myconf="${myconf} --with-gtk=3.0"
	use !gtk3 && myconf="${myconf} --with-gtk=2.0"

	gnome2_src_configure \
		$(use_enable systemd) \
		${myconf}
}
