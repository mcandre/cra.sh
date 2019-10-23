#!/bin/bash
set -eEuo pipefail

DIR="${0%/*}"

shfmt_task() {
    stank "$DIR" |
        xargs shfmt -w -i 4
}

bashate_task() {
    stank "$DIR" |
        xargs bashate
}

shlint_task() {
    stank "$DIR" |
        xargs shlint
}

checkbashisms_task() {
    stank "$DIR" |
        xargs checkbashisms -n -p
}

shellcheck_task() {
    stank "$DIR" |
        xargs shellcheck \
            -e SC1090 \
            -e SC1010
}

TASKS='test'

if [ "$#" -gt 0 ]; then
    TASKS="$*"
fi

for TASK in $TASKS; do
    case "$TASK" in
    shfmt)
        shfmt_task
        ;;
    bashate)
        bashate_task
        ;;
    shlint)
        shlint_task
        ;;
    checkbashisms)
        checkbashisms_task
        ;;
    shellcheck)
        shellcheck_task
        ;;
    lint)
        shfmt_task
        bashate_task
        shlint_task
        checkbashisms_task
        shellcheck_task
        ;;
    test)
        "$DIR"/test.sh
        ;;
    *)
        echo "No such task: $TASK"
        exit 1
        ;;
    esac
done
