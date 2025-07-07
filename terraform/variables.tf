variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "local_jar_path" {
  description = "The relative path to the local JAR file"
  type        = string
}

variable "s3_object_key" {
  description = "The desired object key name in the S3 bucket"
  type        = string
}

variable "region" {
  description = "the region where it show be"
  type = string
}

variable "ami_id" {
  description = "AMI ID from Packer"
  type        = string
}

variable "instance_type" {
  description = "Instance type (e.g., t2.micro)"
  type        = string
}

variable "subnet_id" {
  description = "Subnet to launch instance in"
  type        = string
}

variable "security_group_id" {
  description = "Security group with required ports open"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}
