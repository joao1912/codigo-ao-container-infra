variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefixo para nomear recursos"
  type        = string
  default     = "lab-eks"
}
