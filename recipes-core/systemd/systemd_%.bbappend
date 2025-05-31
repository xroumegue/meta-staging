FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://systemd-networkd-wait-online.preset \
"

FILES:${PN} += " \
    ${systemd_unitdir}/system-preset/99-networkd-wait-online.preset \
"

do_install:append() {
    install -d ${D}${systemd_unitdir}/system-preset
    install -m 0644 \
        ${UNPACKDIR}/systemd-networkd-wait-online.preset \
        ${D}${systemd_unitdir}/system-preset/99-networkd-wait-online.preset
}
