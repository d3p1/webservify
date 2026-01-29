#!/bin/bash

##
# @description An utility to execute commands over `ssh`
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @todo        I do not like to use environment variables in this
#              utility. It is better if receives data from params
##

##
# Execute `ssh` command
#
# @param  string $1 Command
# @return void
##
execute_ssh_cmd() {
    ssh "root@$HOST" $1
}