FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://uboot-0001-configs-zynqmp-Add-fdtoverlay_addr_r-variable.patch \
"
