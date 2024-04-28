# creating SSH -key 
resource "aws_key_pair" "keycreate" {
  key_name   = "key-tf"
  public_key = file("${path.module}/rsa.pub")
}

output "key_name" {
  value = aws_key_pair.keycreate.key_name

}
resource "aws_instance" "demoec2" {
  ami                    = "ami-007020fd9c84e18c7"
  instance_type          = "t2.micro"
  count                  = 2
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  key_name               = aws_key_pair.keycreate.key_name
  subnet_id              = "10.0.1.0/24"
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

