#!/bin/bash

##
# @description An utility to execute commands in a remote machine
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute script
#
# @param  string $1 Remote user
# @param  string $2 Remote host
# @param  string $3 Command
# @return void
##
execute_remote_command() {
    ssh "$1:$2" $3
}