variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket hosting the bulletin board app"
  type        = string
  default     = "bulletin-board-app-oliphant714"
}
variable "aws_access_key" {
  description = "AWS Access Key ID (local testing only)"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key (local testing only)"
  type        = string
  sensitive   = true
}

variable "aws_session_token" {
  description = "AWS Session Token (local testing only)"
  type        = string
  sensitive   = true
}