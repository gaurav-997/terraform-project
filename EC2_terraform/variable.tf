variable "instance_type" {
  default = "t2.micro"
  type    = string

}

variable "ports" {
  type    = list(number)
  default = [22, 80, 443]

}

variable "access_key" {
  type    = string
  default = "vcohriolhe"
  

}

variable "secret_key" {
  type    = string
  default = "liarhlirwhil"
}