#!/bin/bash
set -eEuo pipefail
IFS=$'\n\t '

DIR="${0%/*}"
# shellcheck source=/dev/null
. "${DIR}/../lib/cra.sh"

STATUS_EXPECTED=1
STATUS_OBSERVED=0

crash begin
crash do sh -c 'ls 1>/dev/null'
crash do sh -c 'ls no_such_file 2>/dev/null'
crash end ||
    STATUS_OBSERVED="$?"

[ "$STATUS_OBSERVED" = "$STATUS_EXPECTED" ] ||
    echo "$0: Expected: $STATUS_EXPECTED, Got: $STATUS_OBSERVED"
