#!/bin/bash

##
# @description Install authentication mechanism
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh
source $BASE_DIR/lib/utils/execute-ssh-cmd.sh

##
# Main
# 
# @return void
##
main() {
    print_message "Start install auth" "notice"
    _gen_ssh_keys
    _copy_ssh_pub_key
    _store_ssh_connection
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
# Store `ssh` connection
#
# @return void
##
_store_ssh_connection() {
    _add_ssh_config "##"
    _add_ssh_config "# @note $HOST"
    _add_ssh_config "# @note SSH server connection configured by webservify"
    _add_ssh_config "# @link https://github.com/d3p1/webservify"
    _add_ssh_config "##"
    _add_ssh_config "Host $HOST"
    _add_ssh_config "  Hostname $HOST"
    _add_ssh_config "  User $CUSTOM_USER"
    _add_ssh_config "  AddKeysToAgent yes"
    _add_ssh_config "  IdentityFile $SSH_KEY"
}

##
# Secure `ssh`
#
# @return void
##
_secure_ssh() {
    local conf="/etc/ssh/sshd_config.d/11-secure.conf"

    execute_ssh_cmd "touch $conf"
    execute_ssh_cmd "echo PasswordAuthentication no | sudo tee -a $conf"
    execute_ssh_cmd "echo PubkeyAuthentication yes | sudo tee -a $conf"

    sudo sshd -t && sudo systemctl restart sshd
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

