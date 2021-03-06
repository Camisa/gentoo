# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils toolchain-funcs

DESCRIPTION="Userland client/server for kernel network block device"
HOMEPAGE="http://nbd.sourceforge.net/"
SRC_URI="mirror://sourceforge/nbd/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug zlib"

RDEPEND=">=dev-libs/glib-2.0
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	# Fails to build systemd target.
	# Once this is fixed we don't need autotools.eclass anymore.
	sed '/^SUBDIRS/s@ systemd@@' -i Makefile.am || die
	# eautoreconf fails without this
	sed "s@m4_esyscmd_s(support/genver.sh)@[${PV}]@" -i configure.ac \
		|| die
	eautoreconf
}

src_configure() {
	econf \
		--enable-lfs \
		$(use_enable !debug syslog) \
		$(use_enable debug) \
		$(use_enable zlib gznbd)
}
