# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="This package builds and installs the kernel source tree installed by [kernel]-sources package."
HOMEPAGE="https://github.com/kLeZ/klez-overlay"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources[symlink]
		!sys-freebsd/freebsd-sources"

src_configure() {
	zcat /proc/config.gz > /usr/src/linux/.config
	emake oldconfig
	nonfatal emake modules_prepare
}

src_install() {
	nonfatal emake modules_install
	nonfatal emake install
	nonfatal grub2-mkconfig -o /boot/grub/grub.cfg
}
