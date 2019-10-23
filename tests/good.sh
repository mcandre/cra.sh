#!/bin/sh
DIR="${0%/*}" &&
    . "${DIR}/../lib/cra.sh" &&
    STATUS_EXPECTED=0 &&
    STATUS_OBSERVED=0 &&
    crash begin &&
    crash do sh -c "echo '' >/dev/null" &&
    crash end ||
    STATUS_OBSERVED="$?" &&
    [ "$STATUS_OBSERVED" = "$STATUS_EXPECTED" ] ||
    echo "$0: Expected: $STATUS_EXPECTED, Got: $STATUS_OBSERVED"
