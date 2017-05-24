provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-efd0428f"
  instance_type = "t2.micro"

  tags {
    name = "terraform-gruntwork",
    server = "staging"
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

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
