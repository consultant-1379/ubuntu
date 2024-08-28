#!/bin/bash
# Helper functions.

# Some colors.
RED="\033[1;31m"
GREEN="\033[1;32m"
DEFAULT="\033[0m"
alias reset_term="tput sgr0"

# Colorized echo.
echo () {
    local msg=$1
    col=$2
    echo -e "$col$msg$DEFAULT"
    # reset_term
}

check_rc(){
    local return_code=$1
    if  [[ $return_code -ne 0 ]];then
      echo "\nreturn code: $return_code\n" 
      exit $return_code
    fi
}

