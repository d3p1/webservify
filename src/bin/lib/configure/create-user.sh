#!/bin/bash

##
# @description Create user
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh
source $BASE_DIR/lib/configure/utils/execute-remote-cmd.sh

##
# Main
# 
# @return void
##
main() {
    print_message "Start create user" "notice"
    execute_remote_cmd "adduser $CUSTOM_USER"
    execute_remote_cmd "usermod -aG sudo $CUSTOM_USER"
    print_message "User $CUSTOM_USER has been created with \`sudo\` privileges" "success"
    print_message "End create user" "notice"
}

##
# @note Call main
##
main "$@"

