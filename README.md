# jenkins-terraform-k8s
Deployment on Kubernetes Cluster using Jenkins CI/CD and Terraform 
## BluePrint
![jenkis-1](https://github.com/alilotfi23/jenkins-terraform-k8s/assets/91953142/72a82570-2b6e-4c96-8caa-008016475d42)
## Terraform provider file
A provider in Terraform is a plugin that enables interaction with an API. This includes Cloud providers and Software-as-a-service providers. The providers are specified in the Terraform configuration code. They tell Terraform which services it 
## terraform versions file
Stick to a provider version that ensures there are no breaking changes.
## terrafprm main file
main.tf will contain the main set of configurations for your module.
# run terraform code
Install provider

```shell
terraform init
```
The Terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure

```shell
terraform plan
```
The terraform apply command is used to apply the changes required to reach the desired state of the configuration
```shell
terraform apply
```
## jenkinsfile
The Jenkins pipeline run terraform (init, fmt, validate) before applying the command
