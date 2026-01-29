#!/bin/bash

##
# @description Install authentication mechanism
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @todo        Implement utility to create `ssh` config file because it is
#              used for the install firewall logic, too
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh
source $BASE_DIR/lib/configure/utils/execute-remote-cmd.sh

##
# Main
# 
# @return void
##
main() {
    print_message "Start install auth" "notice"
    _gen_ssh_keys
    _copy_ssh_pub_key
    _secure_ssh
    print_message "End install auth" "notice"
}

##
# Generate `ssh` keys
#
# @return void
##
_gen_ssh_keys() {
    ssh-keygen -t ed25519 -b 4096 -C "$SSH_EMAIL" -f "$SSH_KEY"
}

##
# Copy `ssh` public key to server
#
# @return void
##
_copy_ssh_pub_key() {
    ssh-copy-id -i "$SSH_KEY.pub" "root@$HOST"
}

##
# Secure `ssh`
#
# @return void
##
_secure_ssh() {
    local conf="/etc/ssh/sshd_config.d/11-secure.conf"

    execute_remote_cmd "touch $conf"
    execute_remote_cmd "echo PasswordAuthentication no | sudo tee -a $conf"
    execute_remote_cmd "echo PubkeyAuthentication yes | sudo tee -a $conf"

    execute_remote_cmd "sshd -t && systemctl restart sshd"
}

##
# @note Call main
##
main "$@"

