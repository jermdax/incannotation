#!/bin/sh

GEN_DIR_CL=incannotation_cl
GEN_DIR_SV=incannotation_svr
GEN_SCRIPT='generate.sh'
if [ -d $1 ]; then
  #create the destination directory from where this is running
  mkdir `pwd`/$GEN_DIR
  #copy the files from the given directory into the client generated director
  cp -r $(ls $1 | grep -v $GEN_DIR_CL'$' | grep -v $GEN_DIR_SV $GEN_DIR_CL)
  #copy the files from the given directory into the client generated director
  cp -r $(ls $1 | grep -v $GEN_DIR_SV'$' | grep -v $GEN_DIR_SV $GEN_DIR_SV)
fi
