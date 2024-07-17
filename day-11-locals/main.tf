locals {
  bucket-name ="${var.layer}-${var.env}-bucket-nehaabcd-${var.region}"
}

resource "aws_s3_bucket" "demo" {
    bucket = local.bucket-name
    tags = {
      Name =local.bucket-name
      Environment = var.env
    }
  # bucket ="dev-test-bucket"
  #bucket ="${var.layer}-${var.env}-bucket-nehaabcd"

}

# locals using for long id we can short and simplify that id ex:"${var.layer}-${var.env}-bucket-nehaabcd-${var.region}" =local.bucket-name