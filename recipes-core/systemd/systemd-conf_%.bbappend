FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://systemd-networkd-wait-online-local.conf \
"

FILES:${PN} += " \
    ${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/10-local.conf \
"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d
    install -m 0644 \
        ${WORKDIR}/systemd-networkd-wait-online-local.conf \
        ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/10-local.conf
}