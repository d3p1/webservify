#!/bin/bash

##
# @description An utility to execute commands over `ssh`
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute `ssh` command as root
#
# @param  string $1 Host
# @param  string $2 Command
# @return void
##
exec_root_ssh_cmd() {
    exec_ssh_cmd "root" "$1" "$2"
}

##
# Execute `ssh` command
#
# @param  string $1 User
# @param  string $2 Host
# @param  string $3 Command
# @return void
##
exec_ssh_cmd() {
    ssh "$1"@"$2" $3
}