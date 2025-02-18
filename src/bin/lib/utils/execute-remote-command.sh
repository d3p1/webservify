#!/bin/bash

##
# @description An utility to execute commands in a remote machine
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute remote command
#
# @param  string $1 Remote user
# @param  string $2 Remote host
# @param  string $3 Remote port
# @param  string $4 Command
# @return void
# @note   If `ssh` credentials are not specified,
#         it will be used
#         `REMOTE_SSH_USER`, `REMOTE_SSH_HOST` and `REMOTE_SSH_PORT`
#         environment variables
##
execute_remote_command() {
    local ssh_user
    local ssh_host
    local ssh_port

    ssh_user="$1"
    if [ -z "$ssh_user" ]; then
        ssh_user="$REMOTE_SSH_USER"
    fi

    ssh_host="$2"
    if [ -z "$ssh_host" ]; then
        ssh_host="$REMOTE_SSH_HOST"
    fi

    ssh_port="$3"
    if [ -z "$ssh_port" ]; then
        ssh_port="$REMOTE_SSH_PORT"
    fi

    ssh -p "$ssh_port" "$ssh_user:$ssh_host" $4
}