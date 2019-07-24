# AWS specific vars
variable "aws_access_key" { 
  description = "(Required) The AWS Access key to use with the AWS account"
}

variable "aws_secret_key" { 
  description = "(Required) The AWS Access key to use with the AWS account"
}

# All AWS accounts are provisioned with atleast one "default" VPC
variable "vpc_id" {
  description = "Supply the ID of the VPC to deploy to"
  default = "vpc-7e0c3016"
}

variable "aws_region" {
  description = "(Required) Region to bring the instances up in"
  default     = "us-east-2"
}

# Server specific vars
variable "ssh_public_key" {
  description = "(Required) A public key used to control login access to EC2 instances."
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKoP2j1mYKW0ICghtBjMKswCotXav7iGhwWI4denylzB8YNmXCunhUWCRPL55CDKmefTOt/GOFvbYUft/0X2olfn5+DGLLN6+B5qPZWGO11hKqSAzDsW8H4TY3nxi/BkOibtPuQTZWx+ipRAcCxoh7s8juzHCnyGBvu5EbqzHX/KGGE5TLJGxUjs2M/or0k1nBDA0B98s/9faBc5zBuFbfclp6ma7QGXf3DuU5Fmut/ZirwG4vPoc7Vg6EwwV6AtVJ2El0mrD1O12FM7JncPv53Ak04cY4u+LMX0TwdhJakSJrOQ0x7V70W0k3K/IBe3GOYq11uGICETBXapnQV42d vagrant@ubuntu-bionic"
}

variable "ssh_private_key_path" {
  description = "(Required) Path to the private key of the public key defined above."
}

variable "aws_ami" {
  description = "(Required) Centos 7 AMI, we recommend not changing this value, it is region specific (us-east-2)"
  default     = "ami-0f2b4fc905b0bd1f1"
}

variable "ec2_instance_type" {
  description = "FREE ec2 instance to use, we recommend not changing this value"
  default     = "t2.micro"
}

variable "number_of_instances" {
  description = "Number of instances to provision"
}
