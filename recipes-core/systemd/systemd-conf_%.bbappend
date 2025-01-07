FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://systemd-networkd-wait-online.preset \
"

FILES:${PN} += " \
    ${sysconfdir}/systemd/system-preset/10-networkd-wait-online.preset \
"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/system-preset
    install -m 0644 \
        ${WORKDIR}/sources/systemd-networkd-wait-online.preset \
        ${D}${sysconfdir}/systemd/system-preset/10-networkd-wait-online.preset
}
