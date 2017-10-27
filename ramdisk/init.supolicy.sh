#!/system/bin/sh
# @clannad edit. Permission cleanup and correct policy patches
SUPOLICY=`which supolicy`
SULIBS="/su/lib:/system/lib64:/system/lib"

LD_LIBRARY_PATH=$SULIBS $SUPOLICY --live \
        "allow audioserver audioserver_tmpfs file { read write execute }" 
