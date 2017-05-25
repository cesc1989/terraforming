provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "server" {
  ami = "ami-efd0428f"
  instance_type = "${var.instance_type}"

  tags {
    name = "terraform-gruntwork",
    server = "${var.environment}"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
}

resource "aws_security_group" "instance" {
    name = "terraform-gruntwork-example-instance"

    ingress {
      from_port = "${var.server_port}"
      to_port = "${var.server_port}"
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
