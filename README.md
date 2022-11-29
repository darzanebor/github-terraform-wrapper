### GithubAction Terraform Wrapper
#
##### Examples:
```
- name: Terraform format
  uses: darzanebor/terraform-action@v0.0.1
  env:
    GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"        
  with:
    tf_command: 'fmt'
    tf_path: './env/dev'
```
