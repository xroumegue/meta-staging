SRCREV = "${AUTOREV}"
PV = "master+git${SRCPV}"

SRC_URI = " \
        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
"

LIBCAMERA_PIPELINES = "imx8-isi,vimc,simple,uvcvideo"
