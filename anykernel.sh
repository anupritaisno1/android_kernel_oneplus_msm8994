# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=haruhikernel-op2 by clannad
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=oneplus2
device.name2=OnePlus2
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk
chmod 644 $ramdisk/sbin/media_profiles.xml


## AnyKernel install
dump_boot;

# begin ramdisk changes
insert_line init.qcom.rc "init.haruhi.rc" after "import init.qcom.usb.rc" "import init.haruhi.rc";
insert_line init.qcom.rc "init.spectrum.rc" after "import init.qcom.usb.rc" "import init.spectrum.rc";
insert_line init.qcom.rc "init.fk.rc" after "import init.qcom.power.rc" "import init.fk.rc";
insert_line init.qcom.rc "performance_profiles" after "import init.qcom.power.rc" "import init.performance_profiles.rc";
# end ramdisk changes

write_boot;

## end install

