#!/usr/bin/env bash

# SOURCE sane.bash WITH
# { DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"; source "${DIR}/strict.bash"; }

# http://linuxcommand.org/lc3_man_pages/seth.html
set -o errexit   # error exits script
set -o nounset   # no unset variables
set -o pipefail  # failure on any command errors
set -o errtrace  # shell functions inherit ERR trap
set -o functrace # shell functions inherit DEBUG trap
(( BASH_VERSINFO[0] < 4 || (BASH_VERSINFO[0] == 4 && BASH_VERSINFO[1] < 4) )) || shopt -s inherit_errexit

# xtrace context
export PS4='+(${BASH_SOURCE[0]}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

# shellcheck disable=SC2034,SC2154
trap 'e=$?; set +x; s() { local i=0; while caller $i; do ((++i)); done | while read l f p; do echo "bash: *** [$p:$l $f]${e:+ Error }$e"; e=""; done; }; >&2 echo; >&2 s' ERR # editorconfig-checker-disable-line

# Helper function for logging handpicked commands before executing them
# shellcheck disable=SC2145,SC2294
function exe() { eval ">&2 echo \"$(pwd)\$ $@\"; $@"; }; export -f exe

# Enable xtrace if $VERBOSE/$V is non-null
[ -z "${VERBOSE:-${V:-}}" ] || set -x
