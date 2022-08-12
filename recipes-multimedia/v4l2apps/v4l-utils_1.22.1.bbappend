FILESEXTRAPATHS:prepend := "${THISDIR}/v4l-utils:"

SRC_URI:append = "\
	file://0001-v4l2-utils-update-Linux-headers-for-multiplexed-stre.patch \
	file://0002-v4l2-ctl-Add-routing-and-streams-support.patch \
	file://0003-media-ctl-add-support-for-routes-and-streams.patch \
	file://0004-v4l2-ctl-compliance-add-routing-and-streams-multiple.patch \
	file://0005-v4l2-utils-Change-get_-cap_compose-out_crop-_rect-re.patch \
	file://0006-v4l2-utils-read-write-full-frame-from-to-file-for-m2.patch \
"
