# AWS specific configuration
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_key_pair" "instance_key" {
  key_name   = "aws-instance-key"
  public_key = "${var.ssh_public_key}"
}

# Lookup VPC ID where instance will be launched
data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}


# Instance specific configuration
resource "aws_instance" "webserver" {
 ami                    = "${var.aws_ami}"
 instance_type          = "${var.ec2_instance_type}"
 key_name               = "${aws_key_pair.instance_key.key_name}"
 vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

 tags {
   Name       = "Centos 7 Webserver"
   managed_by = "Terraform"
 }
 
 provisioner "file" {
   content     = "${data.template_file.provisioner_file.rendered}"
   destination = "/tmp/provisioner.sh"
   
   connection {
     type        = "ssh"
     user        = "centos"
     private_key = "${file("${var.ssh_private_key_path}")}"
   }
 }
  
 provisioner "remote-exec" {
   inline = [
     "chmod +x /tmp/provisioner.sh",
     "source /tmp/provisioner.sh"
   ]
   
   connection {
     type        = "ssh"
     user        = "centos"
     private_key = "${file("${var.ssh_private_key_path}")}"
   }
 }
}

# This creates a security group to allow http and ssh ingress access
# and it allows for all out bound traffic, this is applied to the instance above.
resource "aws_security_group" "allow_all" {
  name = "allow-all-sg"
  vpc_id = "${data.aws_vpc.vpc.id}"
  
  # ssh ports
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  # http ports
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  # All outbound allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# This data resource creates a reference to the local
# provision file that provisions the instance on boot
data "template_file" "provisioner_file" {
  template = "${file("${path.module}/scripts/provisioner.sh.tpl")}"
  vars = {
  }
}

