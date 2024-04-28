variable "azs" {
  type    = string
  default = "us-east-1"

}

variable "cidr" {
  default = "10.0.0.0/16"

}

variable "ami" {
  type    = string
  default = "ami-007020fd9c84e18c7"

}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "access_key" {
  type = string
  default = "irehi"
  
}

variable "secret_key" {
  type = string
  default = "iregi"
  
}