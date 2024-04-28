variable "aws_region" {
  default = "us-east-1"
  type    = string

}
variable "access_key" {
  default = "AKIATOMX4KW7P6C2P7IK"
  type    = string

}

variable "secret_key" {
  type    = string
  default = "Jlrt9g6Op0haTH3ZZPOnYyXF7VxrKvylNuGVHzM/"

}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "kubernetes_version" {
  default = 1.29

}