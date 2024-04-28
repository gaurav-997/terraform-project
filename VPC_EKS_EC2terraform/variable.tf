variable "aws_region" {
  default = "us-east-1"
  type    = string

}
variable "access_key" {
  default = "hlrehlreqh"
  type    = string

}

variable "secret_key" {
  type    = string
  default = "hhrehlreihl"

}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "kubernetes_version" {
  default = 1.29

}
