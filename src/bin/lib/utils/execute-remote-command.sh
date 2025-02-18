#!/bin/bash

##
# @description An utility to execute commands in a remote machine
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute remote command
#
# @param  string $1 Command
# @return void
# @todo   For now, this function will used
#         `REMOTE_SSH_USER`, `REMOTE_SSH_HOST` and `REMOTE_SSH_PORT`
#         environment variables, but this it is believed that this logic
#         should be improved so that this function works independently
#         of the context which executed it
##
execute_remote_command() {
    ssh -p "$REMOTE_SSH_PORT" "$REMOTE_SSH_USER:$REMOTE_SSH_HOST" $4
}