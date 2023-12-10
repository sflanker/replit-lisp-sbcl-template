#! /usr/bin/env bash

COPTS=""

if [ "$1" == "--noinform" ]; then
  COPTS="$1"
  shift
fi


sbcl $COPTS --load "$(dirname $0)/setup.lisp" "$@"