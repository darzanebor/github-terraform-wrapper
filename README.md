### GithubAction Terraform Wrapper
#
##### Examples:
```
on:
  push:
    branches:
      - master
env:
  tf_working_dir: './env/dev'

- name: Terraform install
  uses: darzanebor/github-terraform-wrapper@v0.0.2b
   with:
     tf_command: 'install'

- name: Terraform fmt
  uses: darzanebor/github-terraform-wrapper@v0.0.2b
   env:
     GITHUB_TOKEN: "${{ secrets.OAUTH_TOKEN }}"        
   with:
     tf_command: 'fmt'
     tf_path: "${{ env.tf_working_dir }}"

```
