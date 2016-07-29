#!/bin/sh
if [ -d $1 ]; then
  mkdir `pwd`/generated
  cp -r $(ls $1 | grep -v 'generated$' | grep -v 'generate.sh$') generated
fi
