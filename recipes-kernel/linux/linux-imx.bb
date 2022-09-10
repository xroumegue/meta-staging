SUMMARY = "ARM64 generic kernel recipe that uses the linux-yocto and oe-core"

inherit kernel
require recipes-kernel/linux/linux-yocto.inc

KBRANCH = "xroumegue/v6.0/merge"
DEPENDS:append = " rsync-native"

# Override SRC_URI in a copy of this recipe to point at a different source
# tree if you do not want to build from Linus' tree.
SRC_URI = "\
    git://github.com/xroumegue/linux.git;protocol=https;name=machine;branch=${KBRANCH}; \
    git://github.com/xroumegue/yocto-kernel-cache.git;protocol=https;type=kmeta;name=meta;branch=main;destsuffix=${KMETA}"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
LINUX_VERSION ?= "6.0-rc3"
#LINUX_VERSION_EXTENSION:append = "-custom"

KERNEL_EXTRA_ARGS:append = " INSTALL_HDR_PATH=${D}/usr/src/kernels"
PACKAGES:append = " ${KERNEL_PACKAGE_NAME}-headers"

FILES:${KERNEL_PACKAGE_NAME}-headers = "/usr/src/kernels"


KMETA = "kernel-meta"
KERNEL_FEATURES = "\
    features/v4l2-dw100/v4l2-dw100.scc \
    features/v4l2-isi/v4l2-isi.scc \
    features/v4l2-rkisp1/v4l2-rkisp1.scc \
    features/net/imx/stmmac.scc \
    features/drm-hdmi-imx8/drm-hdmi-imx8.scc \
    features/drm-lcdif-imx8/drm-lcdif-imx8.scc \
"

KCONF_BSP_AUDIT_LEVEL = "1"

SRCREV ="${AUTOREV}"
PV = "${LINUX_VERSION}+git${SRCPV}"

COMPATIBLE_MACHINE = "generic-arm64"

do_install:append() {
	oe_runmake -C ${B} ${PARALLEL_MAKE}  headers_install ${KERNEL_EXTRA_ARGS}
}
