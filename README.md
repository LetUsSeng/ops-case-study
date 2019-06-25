# Technical Assessment 

## Summary
The purpose of this project is to gauge your technical ability by providing a sample project that uses Terraform code.
At MedNet Solutions, we use Terraform to develop and manage our Production and Non-production environments in AWS and vSphere.
We are code-centric, and are always writing or evaluating scripts in bash, python, Ansible, Ruby etc.
While we are aware that not everyone  may know every scripting langauge, this role requires the ability to learn effective scripting.
A Cloud Infrastructure Engineer is required to develop a solid understanding of coding paradigms, procedures, syntaxes, and general semantics 
and be comfortable with working within the Linux command line.


This technical assessment requires you to:

1) Setup the terraform software on your local machine.

2) Configure the terraform variables.tf to point at your AWS account. Note that you can create a free AWS account: https://aws.amazon.com/free/

3) Run the terraform code and bring up a running Centos 7 instance in the specified AWS account.

4) Write bash code in the provisioning script provided to convert this instance into a functioning Apache webserver on boot.

5) Deploy and serve up a simple PHP script via the Apache server.

### Sample PHP Script
```php
<html>
 <head>
  <title>Hello World</title>
 </head>
 <body>
 <p>Hello World from: <?php echo file_get_contents('http://169.254.169.254/latest/meta-data/public-ipv4'); ?> </p> 
 </body>
</html>
```
6) Write a simple test to demonstrate that your Apache webserver instance works as expected

_You may modify any parts of the code provided to your liking._

###Bonus points:

 - Convert the terraform script to build multiple instances of the same time utilizing the same `aws_instance` resource provided.
 - **Advanced**: Run the instances behind a load balancer provisioned via Terraform

## Installation and Procedures
`https://www.terraform.io/`

To install terraform follow this guide:

`https://learn.hashicorp.com/terraform/getting-started/install.html`

You can verify terraform is working locally by running:

`terraform version`

Once terraform is installed you will need cd into the working directory of the terraform code provide.
In that directory run the following commands which initializes the local terraform development environment and installs any necessary plugins relevant to the code provided:

`terraform init `

Now that the terraform environment is initialized you will need to setup the terraform `variables.tf` to point at your aws environment.

You will replace each `default` variable with a value that is relevant to your environment:

######For Example:

```
variable "aws_access_key" { 
  description = "(Required) The AWS Access key to use with the AWS account"
  default     = "ASFASDAFASDFASDAFASF"
}
```

Once the variables are set you can run
`terraform plan`
which shows you the actions and resources that terraform will take and create.

If there are no errors then run 
`terraform apply`
to execute the terraform build process.

If there are errors then read and debug until a successful `terraform apply` is completed. 
Note that this script requires a small amount of debugging/fixing to get it to work.

##Expected outcome and Submitting Results
* Commit your code (with fixes) to Github or other repository for viewing
* Be prepared to demo a `terraform destroy`, `terraform plan` and `terraform apply`
