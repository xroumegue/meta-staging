SRCREV = "${AUTOREV}"
PV = "master+git${SRCPV}"

do_configure[network] = "1"

DEPENDS += "libyaml libevent elfutils"
MESONOPTS:remove = "--wrap-mode nodownload"
EXTRA_OEMESON:remove = "-Dpipelines=uvcvideo,simple,vimc"
EXTRA_OEMESON:remove = "-Dipas=vimc"
EXTRA_OEMESON:append = "\
    -Dpipelines=uvcvideo,simple,rkisp1 \
    -Dipas=rkisp1 \
"

PACKAGES =+ "${PN}-python"

PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled, python3, libpython3"

do_install:remove() {
    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
}

do_install:append() {
    find ${D}${libdir} -iname 'libcamera*.so.[0-9].[0-9].[0-9]' -exec chrpath -d {} \;
}

FILES:${PN}-python = " \
    ${PYTHON_SITEPACKAGES_DIR}/libcamera/_libcamera.so \
    ${PYTHON_SITEPACKAGES_DIR}/libcamera/__init__.py \
\"

