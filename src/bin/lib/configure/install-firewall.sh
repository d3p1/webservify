#!/bin/bash

##
# @description Install firewall
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/log.sh

##
# Main
# 
# @return void
##
main() {
    _install_firewall
}

##
# Install firewall
#
# @return void
##
_install_firewall() {
    print_message "Start install firewall" "notice"
    print_message "End install firewall" "notice"
}

##
# @note Call main
##
main "$@"

