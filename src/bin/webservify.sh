#!/bin/bash

##
# @description Webservify.
#              Configure a web server
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Add flag to exit script if there is an error related to a command
##
set -e

##
# @note Init global/environment variables that could be useful
#       for called commands/scripts
##
declare BASE_DIR
BASE_DIR=$(dirname "${BASH_SOURCE[0]}")
export BASE_DIR

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh
source $BASE_DIR/lib/utils/execute-script.sh

##
# Main
#
# @param  string $1 Command to run
# @param  string $2 Command parameters
# @return void
##
main() {
    case "$1" in
        configure)
            if [ ! -e ".webservify_profile" ]; then
                print_message "You must create a \`.webservify_profile\` file with the required exports of variables that are used during command execution" "error"
                print_message "Check for reference: https://github.com/d3p1/webservify/blob/main/src/bin/etc/.webservify_profile.sample" "notice"
                exit 1
            fi

            source .webservify_profile
            _execute_command "$@"
            ;;

        *)
            _print_help
            ;;
    esac

    exit 0
}

##
# Execute command
#
# @param  string $1 Command name
# @param  string $2 Command params
# @return void
# @note   In reality, the `shift` command and
#         the `@` symbol (as a rest operator) are used to retrieve
#         command parameters. Consequently, every argument
#         following the `$1` parameter (command name)
#         is treated as part of `$2`, and will be used as a command parameter
##
_execute_command() {
    local script
    script="$BASE_DIR/lib/$1.sh"
    shift
    execute_script "$script" "$@"
}

##
# Print help message
#
# @return void
##
_print_help() {
    print_message "Usage:" "normal"
    print_message " - To configure a web server: \`webservify configure\`" "normal"
    print_message "Before using this script, remember to configure the \`.webservify_profile\` file" "notice"
}

##
# @note Call main
##
main "$@"