##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

REPLACE="
"

##########################################################################################
# Installation Logic
##########################################################################################

# Module display name
ui_print "*******************************"
ui_print "   Terminal App Systemizer     "
ui_print "  by veez21 @ xda-developers   "
ui_print "*******************************"

# Custom installation steps (extracted from install.sh lines 133-188)
no_app=0
no_privapp=0
no_xml=0
additional_size=0

mkdir -p $TMPDIR/$MODID
COPYPATH=$NVBASE/modules/$MODID

if [ -d $COPYPATH/system/app ]; then
  cp -af $COPYPATH/system/app $TMPDIR/$MODID
else
  no_app=1
fi

if [ -d $COPYPATH/system/priv-app ]; then
  cp -af $COPYPATH/system/priv-app $TMPDIR/$MODID
else
  no_privapp=1
fi

if [ -d $COPYPATH/system/etc/permissions ]; then
  cp -af $COPYPATH/system/etc/permissions $TMPDIR/$MODID
else
  no_xml=1
fi

ui_print "- Extracting module files"
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

if [ $no_app -eq 0 ]; then
  cp -af $TMPDIR/$MODID/app $MODPATH/system
fi
if [ $no_privapp -eq 0 ]; then
  cp -af $TMPDIR/$MODID/priv-app $MODPATH/system
fi
if [ $no_xml -eq 0 ]; then
  mkdir -p $MODPATH/system/etc
  cp -af $TMPDIR/$MODID/permissions $MODPATH/system/etc
fi

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  
  # Copy common files
  cp -af $TMPDIR/aapt $MODPATH/aapt
  cp -af $TMPDIR/mod-util.sh $MODPATH/mod-util.sh
  
  # Get selinux value from previous module installation (if exists)
  se_value=$(grep_prop selinux $COPYPATH/module.prop)
  if [ "$se_value" != "true" ]; then
    se_value=false
  fi
  
  bin=xbin
  if [ ! -d /system/xbin ]; then
    bin=bin
    mkdir $MODPATH/system/$bin
    mv $MODPATH/system/xbin/systemize $MODPATH/system/$bin
    rm -rf $MODPATH/system/xbin/*
    rmdir $MODPATH/system/xbin
  fi
  set_perm $MODPATH/system/$bin/systemize 0 0 0777
  set_perm $MODPATH/aapt 0 0 0777
  set_perm $MODPATH/mod-util.sh 0 0 0777
  echo "selinux=${se_value}" >> $MODPATH/module.prop
}
