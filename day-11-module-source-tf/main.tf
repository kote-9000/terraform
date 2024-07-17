module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"

    name = "single-instance"

    instance_type = "t2.micro"
    key_name = "ks"
    monitoring = true
    vpc_security_group_ids = ["sg-044651545dcb1fef8"]
    subnet_id = "subnet-0cb75d405bf390cc8"
# here is mention the source instance created  subnet-id and SG-id 

    tags = {
      Terraform = "true"
      Environment ="dev"
    }
  
}