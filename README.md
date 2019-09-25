# TerraformBuild

![Image description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmGfoS5hdgWU55o5DYztjBt011_Zav7wbrOQW2kEFUzh9gkiPd)

What is Terraform?
* Terraform is a tool for building, changing, and versioning infrastructure
* This is done through configuration files to describe the components needed to run a single application or entire datacenter
* Terraform generates a plan -> then executes that plans to build the described infrastructure
* Terraform key features:
    * 1.) Infrastructure as Code - blueprint of your infrastructure using a high level configuration syntax
    * 2.) Execution Plans - what Terraform will do when you call apply
    * 3.) Resource Graph - Terraform builds a graph of all your resources
    * 4.) Change Automation - complex changes can be applied with minimal interaction and avoiding many possile human errors

A few important Terraform commands:
* terraform validate -- validates the terraform file to ensure there are no syntax or other issues
* terraform plan -- shows and generates an execution plan on what the apply command will do
* terraform apply -- builds or changes the infrastructure (can include the variables in this command or let the cli prompt you)
* terraform destroy -- destroys the terraform managed infrastructure created

Refer to https://www.terraform.io/ for installation details and further information about getting started with Terraform.