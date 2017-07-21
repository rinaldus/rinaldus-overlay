EAPI=5
inherit eutils

DESCRIPTION="GTK3 & python based GUI for Syncthing"
HOMEPAGE="https://github.com/syncthing/syncthing-gtk"
SRC_URI="https://github.com/syncthing/syncthing-gtk/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
LICENSE="GPL 2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="inotify libnotify nautilus caja"
RESTRICT="mirror"

DEPEND=""
RDEPEND="
		${DEPEND}
		dev-lang/python:2.7
		dev-python/bcrypt
		dev-python/pygobject[cairo]
		dev-python/setuptools
		dev-python/python-dateutil
		sys-process/psmisc
		x11-libs/gtk+:3
		>=net-p2p/syncthing-0.13
		inotify? ( dev-python/pyinotify )
		libnotify? ( x11-libs/libnotify )
		nautilus? ( dev-python/nautilus-python )
		caja? ( dev-python/python-caja )"

S="${WORKDIR}/syncthing-gtk-${PV}"

src_compile() {
	python2.7 setup.py build
}

src_install() {
	dodoc README.md LICENSE

	python2.7 setup.py install --root="${D}" --optimize=1
}

