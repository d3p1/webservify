#!/bin/bash

##
# @description An utility to execute remote commands
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/execute-ssh-cmd.sh

##
# Execute remote commands
#
# @param  string $1 Command
# @return void
##
execute_remote_cmd() {
    execute_ssh_cmd "root" "$HOST" "$1"
}