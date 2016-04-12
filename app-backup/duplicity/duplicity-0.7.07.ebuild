# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Secure backup system using gnupg to encrypt data"
HOMEPAGE="http://www.nongnu.org/duplicity/"
SRC_URI="https://code.launchpad.net/${PN}/0.7-series/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="s3 azure"

DEPEND="net-libs/librsync
app-crypt/gnupg
dev-python/lockfile
dev-python/paramiko[${PYTHON_USEDEP}]
s3? ( dev-python/boto[${PYTHON_USEDEP}] )
azure? ( dev-python/azure[${PYTHON_USEDEP}] )
"

RDEPEND="${DEPEND}"

pkg_postinst() {
	einfo "Duplicity has many optional dependencies to support various backends."
	einfo "Currently it's up to you to install them as necessary."
}
