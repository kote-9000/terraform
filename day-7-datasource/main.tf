data "aws_subnet" "datasource" {
    filter {
      name = "tag:Name"
      values = ["my-subnet"]
    }
}
resource "aws_instance" "datasource" {
    ami ="ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "ks"
    subnet_id = data.aws_subnet.datasource.id
  
}