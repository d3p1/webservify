#!/bin/bash

##
# @description Create user
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh
source $BASE_DIR/lib/utils/execute-remote-command.sh

##
# Main
# 
# @return void
##
main() {
    print_message "Start create user" "notice"
    if [ -n "$REMOTE_USER" ]; then
        execute_remote_command "sudo adduser $REMOTE_USER"
        execute_remote_command "sudo usermod -aG sudo $REMOTE_USER"
        print_message "User $REMOTE_USER has been created with \`sudo\` privileges" "success"
    fi
    print_message "End create user" "notice"
}

##
# @note Call main
##
main "$@"

