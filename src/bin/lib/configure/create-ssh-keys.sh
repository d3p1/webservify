#!/bin/bash

##
# @description Create `ssh` keys
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
    _create_ssh_keys
}

##
# Create `ssh` keys
#
# @return void
##
_create_ssh_keys() {
    print_message "Start create \`ssh\` keys" "notice"
    print_message "End create \`ssh\` keys" "notice"
}

##
# @note Call main
##
main "$@"

