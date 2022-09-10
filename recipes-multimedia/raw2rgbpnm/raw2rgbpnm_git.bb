DESCRIPTION = "Raw image file to pnm converter"
SECTION = "multimedia"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://gitlab.com/ideasonboard/nxp/raw2rgbpnm.git;protocol=https;branch=master"

S = "${WORKDIR}/git"
SRCREV= "${AUTOREV}"
PV = "master+git${SRCPV}"

#do_configure[depends] += "virtual/kernel:do_shared_workdir"

#CFLAGS:prepend = "-I${STAGING_KERNEL_BUILDDIR}/include"

do_compile() {
    oe_runmake CROSS_COMPILE=${TARGET_PREFIX}
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 raw2rgbpnm ${D}${bindir}
}
