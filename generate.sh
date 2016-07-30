#!/bin/sh

GEN_DIR_CL=incannotation_cl
GEN_DIR_SV=incannotation_svr
GEN_SCRIPT='generate.sh'
LOCATIONS_FILE=token_occurances
FILES_OF_INTEREST=*.c

if [ -d $1 ]; then
  #cleanup old resource from last time it was ran
  if [ -d $GEN_DIR_CL ]; then
    rm -rf $GEN_DIR_CL
  fi
  if [ -d $GEN_DIR_SV ]; then
    rm -rf $GEN_DIR_SV
  fi

  #create the destination directory from where this is running
  mkdir `pwd`/$GEN_DIR_CL
  mkdir `pwd`/$GEN_DIR_SV
  #copy the files from the given directory into the client generated director
  cp -r $(ls $1 | grep -v $GEN_DIR_CL'$' | grep -v $GEN_DIR_SV'$') $GEN_DIR_CL
  #copy the files from the given directory into the client generated director
  cp -r $GEN_DIR_CL/* $GEN_DIR_SV

  #grep for the files of interest
  grep -rn "S_VAR" $GEN_DIR_CL > /tmp/$LOCATIONS_FILE --include $FILES_OF_INTEREST
  cp /tmp/$LOCATIONS_FILE $GEN_DIR_SV/$LOCATIONS_FILE
  grep -rn "S_VAR" $GEN_DIR_SV > /tmp/$LOCATIONS_FILE --include $FILES_OF_INTEREST
  cp /tmp/$LOCATIONS_FILE $GEN_DIR_CL/$LOCATIONS_FILE
fi
