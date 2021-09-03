variable "subnet_id" {
  description = "The AWS region to create things in."
  default     = "sub-12345"
}
variable "ami_id" {
  description = "specify amiid"
  default     = "ami=12345"
}
variable "instance_region" {
  description = "specify region"
  default     = "us-east-1"
}
variable "instance_type" {
  description = "specify instance type"
  default     = "t2.micro"
}