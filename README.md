# Technical Assessment 

## Summary
The purpose of this project is to gauge your technical ability and your ability to follow instructions by providing a working example of terraform code. At MedNet Solutions, we use terraform predominantly for the development and management of our Production and Non-production environments in AWS and vSphere. Half of our working day is spent writing or evaluating scripts and code of many different langauges. We are aware that not everyone knows all scripting langauges or may have limited knowledege of scripting, but a good candidate will be able to learn quickly 


The goal of this technical assessment is for you to do the following:

1.) Setup the terraform software on your local machine.

2.) Configure the terraform variables.tf to point at your AWS account

3.) Run the terraform code and bring up a running Centos 7 instance in the specified AWS account.

4.) Write bash code in the provisioning script provided to install necessary software and packages to turn this instance into a running apache webserver upon boot.

*You may modify any parts of the code provided to your liking.*

Bonus points:

 - Convert the terraform script to build multiple instances of the same time utilizing the same `aws_instance` resource provided.
 - TODO


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

If there are errors then read and debug until a successful `terraform apply` is completed.  As long as all the variables are configured properly, the code will work `as is`.

##Expected outcome and Submitting Results
Todo

