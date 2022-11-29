#!/usr/bin/env bash
HELP_MESSAGE="sub commands:\n  - fmt"
case $1 in
  "fmt" )
    terraform fmt -recursive $2
    ;;
  * )
    echo -e "${HELP_MESSAGE}\n"
esac
