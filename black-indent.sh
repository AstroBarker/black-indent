#!/usr/bin/env bash

#      __    __           __         _           __           __ 
#     / /_  / /___ ______/ /__      (_)___  ____/ /__  ____  / /_
#    / __ \/ / __ `/ ___/ //_/_____/ / __ \/ __  / _ \/ __ \/ __/
#   / /_/ / / /_/ / /__/ ,< /_____/ / / / / /_/ /  __/ / / / /_  
#  /_.___/_/\__,_/\___/_/|_|     /_/_/ /_/\__,_/\___/_/ /_/\__/  
#    

# // =--------------------------------------------------------------------= //
# Author: Brandon Barker
# Purpose: Apply `Black` formatting and Adjusts indentation of file
# Usage: ./change-indent.sh [-h] filename target_indent
#  -h             show this help text
#  filename       file to be formatted
#  target_indent  desired indentation level (default=2)
# Requires:
#  black (https://github.com/psf/black)
#  GNU getopt
# // =--------------------------------------------------------------------= //

# ============================================================================
VERSION="1.0.0"
usage="Usage: 
$(basename "$0") [-hv] filename target_indent

Options: 
  -h, --help     show this help text
  -V, --version  display version
  filename       file to be formatted
  target_indent  desired indentation level (default=2)
"

if ! options=$(getopt -o hV --long version,help -n 'change-indent' -- "$@"); then
  echo "Terminating..." >&2; exit 1
fi

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
from=4
to=${2:-2}

black "$1"

unexpand --first-only -t $from "$1" | expand -i -t "$to" > "$1.temp"
mv "$1.temp" "$1"
# ============================================================================
