# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit git-2 eutils distutils-r1

DESCRIPTION="Mail nagger for gnome-shell (port of popper for unity)"
HOMEPAGE="http://launchpad.net/mailnag"
SRC_URI=""

EGIT_REPO_URI="http://github.com/pulb/mailnag.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pygobject:3
		dev-python/gnome-keyring-python
		dev-python/pyxdg
		${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's|./mailnag|mailnag|' ${S}/mailnag_config
}

