#SRCREV = "${AUTOREV}"
#PV = "master+git${SRCPV}"
#
#SRC_URI = " \
#        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
#"

#do_configure[network] = "1"

DEPENDS += "libyaml libevent elfutils ca-certificates-native"
#MESONOPTS:remove = "--wrap-mode nodownload"
EXTRA_OEMESON:remove = "-Dpipelines=uvcvideo,simple,vimc"
EXTRA_OEMESON:remove = "-Dipas=vimc"
EXTRA_OEMESON:append = "\
    -Dpipelines=uvcvideo,simple,rkisp1,imx8-isi \
    -Dipas=rkisp1 \
"

#PACKAGES =+ "${PN}-python"
#PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled, python3, libpython3"

#FILES:${PN}-python = " \
#    ${PYTHON_SITEPACKAGES_DIR}/libcamera/_libcamera.so \
#    ${PYTHON_SITEPACKAGES_DIR}/libcamera/__init__.py \
#\"

