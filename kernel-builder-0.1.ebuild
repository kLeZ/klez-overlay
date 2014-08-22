# Copyright 2014 Alessandro Accardo
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
DESCRIPTION="This package builds and installs the kernel source tree \"installed\" by [kernel]-sources portage package."
HOMEPAGE="https://github.com/kLeZ/klez-overlay"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources"

src_configure() {
	zcat /proc/config.gz > /usr/src/`eselect kernel list | awk '{print $2}' | tail -1`/.config
}

src_install() {
	emake DESTDIR="${D}" modules_install
	emake DESTDIR="${D}" install
}
