# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils
DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="https://github.com/stanfieldr/ghetto-skype"
SRC_URI="https://github.com/stanfieldr/ghetto-skype/releases/download/v${PV}/ghetto-skype_${PV}_amd64.deb"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"
S="${WORKDIR}"

LICENSE="GPL-3"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.xz
}

src_install(){
	doins -r usr
	doins -r opt
	fperms 755 /opt/Ghetto\ Skype/ghetto-skype
}
