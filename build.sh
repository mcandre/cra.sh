#!/bin/sh

shfmt_task() {
    stank . | xargs shfmt -w -i 4
}

bashate_task() {
    stank . | xargs bashate
}

TASKS='test'

if [ "$#" -gt 0 ]; then
    TASKS="$@"
fi

for TASK in "$TASKS"; do
    case "$TASK" in
    shfmt)
        shfmt_task
        ;;
    bashate)
        bashate_task
        ;;
    lint)
        shfmt_task &&
            bashate_task
        ;;
    test)
        ./test.sh
        ;;
    *)
        echo "No such task: $TASK"
        exit 1
        ;;
    esac
done
