# rancher-tf-aws
## Scripts and files to create a rancher kubernetes cluster using terraform on AWS with minimum steps.

### Overview
The terraform files and scripts in this repo will allow you to create a rancher kubernetes cluster on AWS with very little effort.
There are few steps to do as a one time activity
and after that, 
if you want to create a cluster, all you need to do is run: `terraform apply` and to destroy the cluster just run `terraform destroy`
You will get following resources created:
- VPC
- NAT gateway
- Public Subnet
- Private subnet
- Security groups
- Your custom keypair
- EC2 instances running RancherOS

### Pre requisites

* AWS account with privileges to create EC2, VPC resources.
* Access Key and Secret Access Key for above account
* ssh keypair generated for your user
* terminal which understands bash (Mac users can open regular command prompt), while Windows users need a bash emulator like [gitbash](https://git-scm.com/download/win) or [cygwin](https://cygwin.com/install.html) or [MobaXterm] (http://mobaxterm.mobatek.net/download.html)

### One time setup steps

* Clone this repo in an empty folder 
* Create a new ssh keypair via ssh-keygen
* Copy your public and private keys in ssh folder 
* Customize terraform.tfvars.SAMPLE and rename to terraform.tfvars

### Steps to create kubernetes on rancher 

* Run `terraform apply` This will do following steps:
  1. Create an VPC, security groups and EC2 instance as master and start rancher server on it 
  2. Once EC2 instance is created, script waits 50 seconds for the rancher server to boot up. 
  3. API are triggered to create a rancher environment called "k8srancher" (or your own defined name if you have overwritten the default in terraform.tfvars), and rancher server is activated as first host of the cluster.
  4. Terraform is called again to create remaining EC2 instances and join them to the cluster. 

### Steps to destroy the cluster 

* cd to repo folder and run `terraform destroy`. There will be a prompt from terraform for confirmation, type `yes` and all resources will be destroyed.

