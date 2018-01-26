# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='threads(+)'
inherit xfconf vala waf-utils python-any-r1

DESCRIPTION="Embed DockbarX in the xfce4-panel"
HOMEPAGE="http://xfce-look.org/content/show.php/xfce4-dockbarx-plugin+%2B+Mouse+DBX+Theme?content=157865"
SRC_URI="https://github.com/TiZ-EX1/xfce4-dockbarx-plugin/archive/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-lang/vala
	>=x11-misc/dockbarx-0.91
	xfce-base/xfce4-panel
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"

src_configure() {
#	cd "${WORKDIR}"/"${PN}-${PV}"
    sed -i -e 's/${PREFIX}\/lib\/xfce4\/panel\/plugins/${PREFIX}\/lib64\/xfce4\/panel\/plugins/g' wscript
	waf-utils_src_configure --prefix=${EPREFIX}/usr
	waf-utils_src_compile
}

