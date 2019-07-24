resource "aws_lb" "lb" {
  name               = "lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.allow_all.id}"]
  subnets            = "${data.aws_subnet_ids.public_subnet_ids.ids}"

  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.tg.arn}"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "tf-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${data.aws_vpc.vpc.id}"
}

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = "${aws_lb_target_group.tg.arn}"
  count            = "${var.number_of_instances}"
  target_id        = "${element(split(",", join(",", aws_instance.webserver.*.id)), count.index)}"
  port             = 80
}
