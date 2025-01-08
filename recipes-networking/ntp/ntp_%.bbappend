
NTP_SERVER = "${@ d.getVar('CONF_NTP_SERVER') or ""}"
do_install:append() {
  if [ -n "${NTP_SERVER}" ]; then
        sed -i -e "s/#\s*server\s\+\(.*\)/server ${NTP_SERVER}/" ${D}${sysconfdir}/ntp.conf
  fi
}
