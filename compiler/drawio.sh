#!/bin/bash
#
# Script compiles drawio project files to PDF
#
# Usage:
#   "drawio.sh --help"               - prints help info
#   "drawio.sh --dir <dir>"          - recursively converts files from specific directory
#   "drawio.sh --drawio-bin <bin>"   - specifies drawio custom binary path
#

# Prints tool usage info.
# Outputs:
#   Writes help information to stdout
usage() {
  echo "
  usage: $0 OPTIONS:
    --help        Prints help info
    --dir <dir>   Specifies files directory"
  exit 0
}

# Prints error and exit.
# Arguments:
#   Error message
# Outputs:
#   Message to stderr
# Returns:
#   1
die() {
  echo "$@" >&2
  exit 1
}

function parse_args() {
  local args=()
  DRAWIO_FILES_DIR=
  DRAWIO_BIN=$(which drawio)
  while (( "$#" )); do
    case "$1" in
      --help)
        usage
        ;;
      --dir)
        DRAWIO_FILES_DIR="$2"
        shift
        ;;
      --drawio-bin)
        DRAWIO_BIN="$2"
        shift
        ;;
      *)
        args=("${args[@]}" "$1")
        ;;
    esac
    shift
  done

  [ -z "$DRAWIO_FILES_DIR" ] && DRAWIO_FILES_DIR="."

  if [[ ${#args[@]}  != 0 ]]; then die "Invalid option"
  fi
}

main() {
  find "$DRAWIO_FILES_DIR" -type f -name "*.drawio" -print0 | while read -d $'\0' file
  do
    "$DRAWIO_BIN" -x -f pdf -o "$file".pdf "$file"
  done
}

parse_args "$@"
main