resource "aws_instance" "name" {
    ami="ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "ks"
    tags = {
      Name="change"
    } 



 #   lifecycle {
  #    create_before_destroy = true
   # }

 #   lifecycle {
  #   ignore_changes = [tags,]
   # }

    #lifecycle {
     # prevent_destroy = true
    #}
}

