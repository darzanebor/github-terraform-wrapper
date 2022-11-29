#!/usr/bin/env bash
HELP_MESSAGE="sub commands:\n  - fmt"
case $1 in
  "init" )
    terraform -chdir=$2 init -input=false
    ;;
  "plan" )
    terraform -chdir=$2 plan -input=false
    ;;
  "apply" )
    terraform -chdir=$2 apply -auto-approve
    ;;    
  "fmt" )
    terraform -chdir=$2 fmt -recursive
    ;;
  * )
    echo -e "${HELP_MESSAGE}\n"
esac
