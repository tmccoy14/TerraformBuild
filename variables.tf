variable "ami" {
  type = "string"
  description = "AWS AMI To Launch Instance With"
}

variable "route53" {
  description = "Need for DNS validation, hosted zone name where record validation will be stored."
  type        = "string"
}
