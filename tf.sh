#!/usr/bin/env bash
# Define some variables
HELP_MESSAGE="sub commands:\n  - fmt\n  - install\n  - init\n  - plan\n  - apply"

# Get latest terraform version and build url if custom version is not set.
#if [ -n "$TERRAFORM_VERSION" ]; then
  TERRAFORM_URL="https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')_linux_amd64.zip"
#else
#  TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
#fi

# Wrap around terraform
case $1 in
  "install" )
    if [ ! -f "${HOME}/.local/bin/terraform" ]; then
        echo -e "Downloading terraform"
        mkdir -p "${HOME}/.local/bin"
        echo "${HOME}/.local/bin" >> $GITHUB_PATH
        curl -L "${TERRAFORM_URL}" -o terraform.zip
        unzip terraform.zip
        ls -l .
        mv ./terraform "${HOME}/.local/bin/"
        rm -rf terraform.zip
        echo -e "Installed terraform:\n"        
        terraform version
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
