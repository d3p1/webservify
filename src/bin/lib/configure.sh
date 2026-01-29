#!/bin/bash

##
# @description Webservify configure command
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Import required utilities
##
source $BASE_DIR/lib/utils/execute-script.sh

##
# Main
#
# @return void
##
main() {
    ##
    # @note Execute script to create user
    ##
    _execute_configure_script "create-user"

    ##
    # @note Execute script to install auth
    ##
    _execute_configure_script "install-auth"

    ##
    # @note Execute script to add firewall
    ##
    _execute_configure_script "install-firewall"

    ##
    # @note Execute script to install credentials
    ##
    _execute_configure_script "install-credentials"
}

##
# Execute configure script
#
# @param  string $1 Script name
# @return void
##
_execute_configure_script() {
    execute_script "$BASE_DIR/lib/configure/$1.sh"
}

##
# @note Call main
##
main "$@"