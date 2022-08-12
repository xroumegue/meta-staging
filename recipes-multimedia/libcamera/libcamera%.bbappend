SRCREV = "${AUTOREV}"
PV = "master+git${SRCPV}"

do_configure[network] = "1"

DEPENDS += "libyaml libevent"
MESONOPTS:remove = "--wrap-mode nodownload"
EXTRA_OEMESON:remove = "-Dpipelines=uvcvideo,simple,vimc"
EXTRA_OEMESON:remove = "-Dipas=vimc"
EXTRA_OEMESON:append = "\
    -Dpipelines=uvcvideo,simple,rkisp1 \
    -Dipas=rkisp1 \
"

PACKAGES =+ "${PN}-python"

PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled, python3, libpython3"

FILES:${PN}-python = " \
    ${PYTHON_SITEPACKAGES_DIR}/libcamera/_libcamera.so \
    ${PYTHON_SITEPACKAGES_DIR}/libcamera/__init__.py \
\"

