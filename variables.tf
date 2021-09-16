variable "subnet_id" {
  description = "The AWS region to create things in."
  type = string
  default     = "subnet-00df62d333354c0ce"
}
variable "ami_id" {
  type = string
  description = "specify amiid"
  default     = "ami-0c2b8ca1dad447f8a"
}
variable "instance_region" {
  type = string
  description = "specify region"
  default     = "us-east-1"
}
variable "instance_type" {
  type = string
  description = "specify instance type"
  default     = "t2.micro"
}
variable "instance_vpcid" {
  type = string
  description = "specify vpc id"
  default     = "vpc-011c048571ccc118a"
}
