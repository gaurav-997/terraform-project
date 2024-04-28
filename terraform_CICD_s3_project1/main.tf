# creating SSH -key 
resource "aws_key_pair" "keycreate" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.keycreate.key_name

}

resource "aws_instance" "gaurav" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.keycreate.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  user_data              = base64encode(file("${path.module}/website.sh"))
  tags = {
    Name = "CICDEc2Instance"
  }


}