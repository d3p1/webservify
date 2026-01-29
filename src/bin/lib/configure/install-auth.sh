#!/bin/bash

##
# @description Install authentication mechanism
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
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
    _store_ssh_connection
    print_message "End install auth" "notice"
}

##
# Generate `ssh` keys
#
# @return void
##
_gen_ssh_keys() {
    print_message "Start \`ssh\` key generation" "notice"
    ssh-keygen -t ed25519 -b 4096 -C "$SSH_EMAIL" -f "$SSH_KEY"
    print_message "End \`ssh\` key generation" "notice"
}

##
# Copy `ssh` public key to server
#
# @return void
##
_copy_ssh_pub_key() {
    print_message "Start copy \`ssh\` public key to server" "notice"
    ssh-copy-id -i "$SSH_KEY.pub" "root@$HOST"
    print_message "End copy \`ssh\` public key to server" "notice"
}

##
# Secure `ssh`
#
# @return void
# @link   https://www.hostinger.com/tutorials/how-to-change-ssh-port-vps
##
_secure_ssh() {
    print_message "Start secure \`ssh\` connection" "notice"

    local conf="/etc/ssh/sshd_config.d/11-secure.conf"
    execute_remote_cmd "touch $conf"
    _add_remote_ssh_config "PasswordAuthentication no" "$conf"
    _add_remote_ssh_config "PubkeyAuthentication yes" "$conf"
    _add_remote_ssh_config "Port $CUSTOM_SSH_PORT" "$conf"
    execute_remote_cmd "sshd -t && systemctl restart sshd"

    print_message "End secure \`ssh\` connection" "notice"
}

##
# Store `ssh` connection
#
# @return void
##
_store_ssh_connection() {
    print_message "Start store \`ssh\` connection" "notice"

    _add_local_ssh_setting ""
    _add_local_ssh_setting "##"
    _add_local_ssh_setting "# @note $HOST"
    _add_local_ssh_setting "# @note SSH server connection configured by webservify"
    _add_local_ssh_setting "# @link https://github.com/d3p1/webservify"
    _add_local_ssh_setting "##"
    _add_local_ssh_setting "Host $HOST"
    _add_local_ssh_setting "  Hostname $HOST"
    _add_local_ssh_setting "  User $CUSTOM_USER"
    _add_local_ssh_setting "  Port $CUSTOM_SSH_PORT"
    _add_local_ssh_setting "  AddKeysToAgent yes"
    _add_local_ssh_setting "  IdentityFile $SSH_KEY"

    print_message "End store \`ssh\` connection" "notice"
}

##
# Add config to remote `ssh`
#
# @param  string $1 Setting
# @param  string $2 Config file
# @return void
##
_add_remote_ssh_config() {
    execute_remote_cmd "printf \"%s\n\" '""$1""' | tee -a ""$2"""
}

##
# Add setting to local `ssh` config file
#
# @param  string $1 Setting
# @return void
##
_add_local_ssh_setting() {
    _add_setting_to_conf "$1" "$HOME/.ssh/config"
}

##
# Add setting to conf file
#
# @param  string $1 Setting
# @param  string $2 Config file
# @return void
##
_add_setting_to_conf() {
    printf '%s\n' "$1" | tee -a "$2"
}

##
# @note Call main
##
main "$@"

