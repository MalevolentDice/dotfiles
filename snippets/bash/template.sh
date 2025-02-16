#!/usr/bin/bash
##  Usage ${scriptName} [OPTION]
## 
##  DESCRIPTION
##     This is a script template.
## 
##  OPTIONS
##     -h, --help  Print this help
## 
##  EXAMPLES
##     ${scriptName} -o DEFAULT arg1 arg2
##
set -Eeuo pipefail
scriptName="$(basename "${0}")"
readonly scriptName
usage() { grep -e "^##" "${scriptName}" | sed -e "s/^##//g" -e "s/\${scriptName}/${scriptName}/g" >&2; }
die() {
    local -r msg="${1}"
    local -r code="${2:-90}"
    echo "${msg}" >&2
    exit "${code}"
}
# ${1?"Missing parameter"}
# assign FOO=bar iff FOO is unset or empty
#: "${FOO:=bar}"

while :; do
  case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    -p | --param) # example named parameter
      param="${2-}"
      shift
      ;;
    -?*) "Unknown option: ${1}" ;;
    *) break ;;
  esac
  shift
done
