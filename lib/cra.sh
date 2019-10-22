#!/bin/sh

usage_crash() {
    cat <<EOF
Usage:

crash begin                            Initialize crash for current shell session
crash do <command> [<arg> [<arg>...]]  Soft assert command
crash end                              Evaluate assertions

crash help                             Show usage information
EOF
}

crash() {
    if [ -z "$1" ]; then
        usage_crash
        return 1
    fi

    SUBCOMMAND="$1"

    case "$SUBCOMMAND" in
    	begin)
    		export CRASH_STATUS='0'
            ;;
    	do)
            if [ "$#" -lt 2 ]; then
                usage_crash
                return 1
            fi

            shift
            "$@" || export CRASH_STATUS=1
            ;;
    	end)
            if [ "$CRASH_STATUS" = '1' ]; then
                return 1
            fi
            ;;
        help)
            usage_crash;;
        *)
            usage_crash
            return 1
            ;;
    esac
}
