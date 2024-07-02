FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://systemd-networkd-wait-online-local.conf \
"

FILES:${PN} += " \
    ${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/10-local.conf \
"

S = "${WORKDIR}/sources"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d
    install -m 0644 \
        ${S}/systemd-networkd-wait-online-local.conf \
        ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/10-local.conf
}
