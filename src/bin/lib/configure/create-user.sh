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
    _create_user
}

##
# Create user
#
# @return void
##
_create_user() {
    print_message "Start create user" "notice"
    print_message "End create user" "notice"
}

##
# @note Call main
##
main "$@"

