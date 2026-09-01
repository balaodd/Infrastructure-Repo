variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}