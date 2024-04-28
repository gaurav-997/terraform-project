variable "ami" {
  type    = string
  default = "ami-04e5276ebb8451442"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"

}

variable "ports" {
  type    = list(number)
  default = [22, 80, 443]


}

variable "bucketname" {
  type    = string
  default = "gaurav-cicd"

}
