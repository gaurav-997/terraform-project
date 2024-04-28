resource "aws_instance" "ec2_cicd" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  security_groups             = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  tags = {
    name = "ec2_cicd"
  }

}