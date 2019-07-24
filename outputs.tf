
output "instance_public_ip" {
  value = "${formatlist("%v", aws_instance.webserver.*.public_ip)}"
}
