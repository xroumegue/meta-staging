LICENSE = "CLOSED"

inherit systemd

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "srv-dev.mount"

SRC_URI = "file://srv-dev.mount "
FILES:${PN} += "${sysconfdir}/systemd/system/srv-dev.mount"

PACKAGES = "${PN}"

def get_ip_addr(bb, d):
    import socket
    return socket.gethostbyname(socket.gethostname())

SERVERIP = "${@ d.getVar('CONF_CUSTOM_NFS_IP_ADDRESS') or get_ip_addr(bb, d)}"

do_install[network] = "1"

do_install:append() {
  install -d ${D}${sysconfdir}/systemd/system
  install -m 0644 ${WORKDIR}/srv-dev.mount ${D}${sysconfdir}/systemd/system
  sed -i -e "s/What=\(.*\):/What=${SERVERIP}:/" ${D}${sysconfdir}/systemd/system/srv-dev.mount
}
