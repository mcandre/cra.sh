#!/bin/sh

shfmt_recursive() {
    stank . | xargs shfmt -w -i 4
}

TASKS='test'

if [ "$#" -gt 0 ]; then
    TASKS="$@"
fi

for TASK in "$TASKS"; do
    case "$TASK" in
    lint)
        shfmt_recursive
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
