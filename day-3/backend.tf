terraform {
  backend "s3" {
    bucket = "ammuneha"
    key = "day-3/terraform.tfstate"
    region = "ap-south-1"
    
  }
}