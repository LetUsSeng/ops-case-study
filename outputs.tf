
output "instance_public_ip" {
  value = "${formatlist("%v", aws_instance.webserver.*.public_ip)}"
}

output "subnet_output_id" {
  value = "${aws_lb.lb.dns_name}"
}