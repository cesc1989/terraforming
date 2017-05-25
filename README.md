# Terraforming

Learning Terraform

## Guides

- [Terraform getting started guide](https://www.terraform.io/intro/index.html)
- [Gruntwork Guide](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca#.b6sun4nkn)

## Folder Layout for Terraform projects

Recommended by Gruntwork guide:

```
stage
  └ vpc
  └ services
      └ frontend-app
      └ backend-app
  └ data-storage
      └ mysql
      └ redis
prod
  └ vpc
  └ services
      └ frontend-app
      └ backend-app
  └ data-storage
      └ mysql
      └ redis
mgmt
  └ vpc
  └ services
      └ bastion-host
      └ jenkins
global
  └ iam
  └ route53
```
