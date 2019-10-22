#!/bin/sh

usage_crash() {
	echo -e "Usage:\n"

	echo -e "crash begin\t\t\t\tInitialize crash for current shell session"
	echo -e "crash do <command> [<arg> [<arg>...]]\tSoft assert command"
	echo -e "crash end\t\t\t\tEvaluate assertions\n"

	echo -e "crash help\t\t\t\tShow usage information"
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

            ${@:2} || export CRASH_STATUS=1
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
