terraform {
  required_version = "1.3.5"
}
# creating data sources , for fetching the AMI ID 
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "aws_ami" {
  value = data.aws_ami.ubuntu.id

}


# creating SSH -key 
resource "aws_key_pair" "keycreate" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.keycreate.key_name

}

# creating Security groups
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # dynamic block addition is like the for loop ,here we open ingress SG for ports 22,80,443
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"

    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "ec2demo" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.keycreate.key_name        # assinging the ssh-key to ec2 instance
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"] # attaching SG to EC2 
  tags = {
    Name = "FirstEc2Instance"
  }
  user_data = <<EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install nginx -y
  sudo echo "hey Gaurav, How are you" >/var/www/html/index.html
  EOF
}