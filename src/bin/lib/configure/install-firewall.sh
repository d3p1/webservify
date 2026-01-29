#!/bin/bash

##
# @description Install firewall
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
    print_message "Start install firewall" "notice"
    _install_ufw
    _allow_ufw_web_ports
    _allow_ufw_custom_ssh_port
    _enable_ufw
    print_message "End install firewall" "notice"
}

##
# Install `ufw` to manage firewall
#
# @return void
##
_install_ufw() {
    print_message "Start install \`ufw\` package" "notice"
    execute_ssh_cmd "apt-get update"
    execute_ssh_cmd "apt-get install ufw"
    print_message "End install \`ufw\` package" "notice"
}

##
# Allow `ufw` web ports
#
# @return void
##
_allow_ufw_web_ports() {
    print_message "Start allow \`ufw\` web ports" "notice"
    _allow_ufw_port "80"
    _allow_ufw_port "443"
    print_message "End allow \`ufw\` web ports" "notice"
}

##
# Allow `ufw` custom `ssh` port
#
# @return void
##
_allow_ufw_custom_ssh_port() {
    print_message "Start allow \`ufw\` custom ssh port" "notice"
    if [ -n "$CUSTOM_SSH_PORT" ]; then
        _allow_ufw_port "$CUSTOM_SSH_PORT"
        _configure_custom_ssh_port
    fi
    print_message "End allow \`ufw\` custom ssh port" "notice"
}

##
# Enable `ufw`
#
# @return void
##
_enable_ufw() {
    print_message "Start enable \`ufw\` package" "notice"
    execute_ssh_cmd "ufw enable"
    print_message "End enable \`ufw\` package" "notice"
}

##
# Allow `ufw` port
#
# @param  string $1 Port
# @return void
##
_allow_ufw_port() {
    print_message "Start allow \`$1\` port" "notice"
    execute_ssh_cmd "ufw allow \"""$1/tcp""\""
    print_message "End allow \`$1\` port" "notice"
}

##
# Configure custom SSH port
#
# @return void
# @link   https://www.hostinger.com/tutorials/how-to-change-ssh-port-vps
##
_configure_custom_ssh_port() {
    local conf="/etc/ssh/sshd_config.d/11-port.conf"

    print_message "Start \`ssh\` service configuration" "notice"
    execute_ssh_cmd "touch $conf"
    execute_ssh_cmd "echo Port $CUSTOM_SSH_PORT | tee -a $conf"
    execute_ssh_cmd "systemctl restart sshd"
    print_message "End \`ssh\` service configuration" "notice"
}

##
# @note Call main
##
main "$@"

