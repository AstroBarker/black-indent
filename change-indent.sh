#!/usr/bin/env bash

# // =--------------------------------------------------------------------= //
# Author: Brandon Barker
# Purpose: Adjusts indentation of file
# Usage: ./change-indent.sh [-h] filename current_indent target_indent
#  -h             show this help text
#  filename       file to be formatted
#  current_indent current indentation level (default=4)
#  target_indent  desired indentation level (default=2)
# // =--------------------------------------------------------------------= //

# ============================================================================
VERSION="1.0.0"
usage="Usage: 
$(basename "$0") [-hv] filename current_indent target_indent

Options: 
  -h             show this help text
  -v             display version
  filename       file to be formatted
  current_indent current indentation level (default=4)
  target_indent  desired indentation level (default=2)
"

options=$(getopt -o hV --long version,help -n 'change-indent' -- "$@")

if [ $? != 0 ]; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$options"

while true; do
  case "$1" in
    -h|--help) echo "$usage"
       exit
       ;;
    -V|--version) echo "version $VERSION";
       exit ;;
    --) shift; break;;
    *) break;;
  esac
done
# ============================================================================

# check that we have a filename present
if [[ "$#" -lt 1 ]]; then
  echo "$usage" >&2
  exit
fi

# check if filename exists
if [[ ! -f "$1" ]]; then
  echo "Error: file $1 does not exist!" >&2
  exit
fi

# ============================================================================
from=${2:-4}
to=${3:-2}
unexpand --first-only -t $from $1 | expand -i -t $to > "$1.temp"
mv "$1.temp" "$1"
# ============================================================================
