# creating SSH -key 
resource "aws_key_pair" "keycreate" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.keycreate.key_name

}

resource "aws_instance" "instance" {
  ami                         = "ami-007020fd9c84e18c7"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.keycreate.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install nginx -y
  sudo echo "hey Gaurav, How are you" >/var/www/html/index.html
  EOF

  tags = {
    "Name" : "Kanye"
  }
}