#!/bin/bash

##
# @description Create user
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh

##
# Main
# 
# @return void
##
main() {
    print_message "Start create user" "notice"
    if [ -n "$CUSTOM_USER" ]; then
        sudo adduser "$CUSTOM_USER"
        sudo usermod -aG sudo "$CUSTOM_USER"
        print_message "User $CUSTOM_USER has been created with \`sudo\` privileges" "success"
    fi
    print_message "End create user" "notice"
}

##
# @note Call main
##
main "$@"

