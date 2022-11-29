### GithubAction Terraform Wrapper
#
##### Examples:
```
...
env:
  tf_working_dir: './env/dev'
....
- name: Terraform format
  uses: darzanebor/github-terraform-wrapper@v0.0.2a
   env:
     GITHUB_TOKEN: "${{ secrets.OAUTH_TOKEN }}"        
   with:
     tf_command: 'fmt'
     tf_path: "${{ env.tf_working_dir }}"
```
