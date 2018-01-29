variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable "region"     { 
  description = "AWS region to host your network"
  default     = "us-east-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.128.1.0/24"
}

/* Rancher amis by region */
/* Updates via https://github.com/rancher/os/blob/master/README.md/#user-content-amazon */
variable "amis" {
  type = "map"
  description = "Base AMI to launch the instances with"
  default = {
    eu-west-3	=	"ami-7503b408"
    eu-west-2	=	"ami-0d938b69"
    eu-west-1	=	"ami-be0293c7"
    ap-northeast-2	=	"ami-e8af0f86"
    ap-northeast-1	=	"ami-a873edce"
    sa-east-1	=	"ami-c11153ad"
    ca-central-1	=	"ami-d3f471b7"
    ap-southeast-1	=	"ami-647e0e18"
    ap-southeast-2	=	"ami-3643b154"
    eu-central-1	=	"ami-4c22b123"
    us-east-1	=	"ami-72613d08"
    us-east-2	=	"ami-67d1fa02"
    us-west-1	=	"ami-16cdcd76"
    us-west-2	= "ami-8916a3f1"
  }
}
variable "aws_public_key" {
	description = "Value of the public key"
}

variable "aws_private_key_name" {
	description = "Name of the private key to be used for connection"
}

variable "aws_machine_type" {
  default = "t2.medium"
}

variable "master_aws_machine_type" {
  default = "t2.medium"
}

variable "k8s_node_count" {
  description = "Number of Nodes in k8s cluster including master node"
  default = 3
}

variable "rs_proj_name" {
  description = "Name of the rancher project"
  default = "k8srancher"
}