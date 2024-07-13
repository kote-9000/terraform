terraform {
  backend "s3" {
    bucket = "ammuneha"
    key = "day-5/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
    
  }
}