#!/bin/bash

##
# @description Install credentials to connect to the server
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
    print_message "Start install credentials" "notice"
    _store_ssh_connection
    print_message "End install credentials" "notice"
}

##
# Store `ssh` connection
#
# @return void
##
_store_ssh_connection() {
    _add_ssh_config ""
    _add_ssh_config "##"
    _add_ssh_config "# @note $HOST"
    _add_ssh_config "# @note SSH server connection configured by webservify"
    _add_ssh_config "# @link https://github.com/d3p1/webservify"
    _add_ssh_config "##"
    _add_ssh_config "Host $HOST"
    _add_ssh_config "  Hostname $HOST"
    _add_ssh_config "  User $CUSTOM_USER"
    _add_ssh_config "  Port $CUSTOM_SSH_PORT"
    _add_ssh_config "  AddKeysToAgent yes"
    _add_ssh_config "  IdentityFile $SSH_KEY"
}

##
# Add setting to `ssh` config file
#
# @param  string $1 Setting
# @return void
##
_add_ssh_config() {
    echo "$1" | sudo tee -a ~/.ssh/config
}

##
# @note Call main
##
main "$@"

