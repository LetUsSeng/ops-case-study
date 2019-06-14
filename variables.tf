# AWS specific vars
variable "aws_access_key" { 
  description = "(Required) The AWS Access key to use with the AWS account"
  default     = "replace_with_value"
}

variable "aws_secret_key" { 
  description = "(Required) The AWS Access key to use with the AWS account"
  default     = "replace_with_value"

}

variable "aws_region" {
  description = "(Required) Region to bring the instances up in"
  default     = "us-east-2"
}

# Server specific vars
variable "ssh_public_key" {
  description = "(Required) A public key used to control login access to EC2 instances."
  default     = "replace_with_value"
}

variable "ssh_private_key_path" {
  description = "(Required) Path to the private key of the public key defined above."
  default     = "replace_with_value"
}

variable "aws_ami" {
  description = "(Required) Centos 7 AMI, we recommend not changing this value, it is region specific (us-east-2)"
  default     = "ami-e1496384"
}

variable "ec2_instance_type" {
  description = "FREE ec2 instance to use, we recommend not changing this value"
  default     = "t2.micro"
}