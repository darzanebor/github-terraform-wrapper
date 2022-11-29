#!/usr/bin/env bash
HELP_MESSAGE="sub commands:\n  - fmt\n  - install\n  - init\n  - plan\n  - apply"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')_darwin_amd64.zip"
case $1 in
  "install" )
    if [ ! -f "${HOME}/.local/bin/terraform" ]; then
        echo "${HOME}/.local/bin" >> $GITHUB_PATH        
        echo -e "Downloading terraform"
        curl -L "${TERRAFORM_URL}" -o terraform.zip
        unzip terraform.zip
        mv terraform "${HOME}/.local/bin/"
        echo -e "Installed terraform:\n"
        "${HOME}/.local/bin/terraform" version
    fi
    ;;
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
