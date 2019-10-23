#!/bin/bash
set -eEuo pipefail
IFS=$'\n\t '

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

lint_task() {
    shfmt_task
    bashate_task
    shlint_task
    checkbashisms_task
    shellcheck_task
}

test_task() {
    "$DIR"/test.sh
}

build_task() {
    lint_task
    test_task
}

TASKS='build'

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
        lint_task
        ;;
    test)
        test_task
        ;;
    build)
        build_task
        ;;
    *)
        echo "No such task: $TASK"
        exit 1
        ;;
    esac
done
