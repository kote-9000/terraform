variable "aws_region" {
    description = "the regionin which to create infrastracture"
    type = string
    nullable = false
    default = "change me"

    validation {
      condition = var.aws_region == "us-west-1" || var.aws_region =="us-west-2"
      error_message = "The variable 'aws_region' must be one of the following regions: us-west-1,us-west-2"
    }
}

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "teju" {
    bucket = "nehaabcd"
  
}