resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name

    #sequence-1
    # count = 3
    #tags = {
     # Name = "web"
    #}

    # sequence-2
   # count = 3
    #tags = {
     # Name = "web-${count.index}"
    #}

  #sequence-3
  count = length(var.teju)
  tags = {
    Name = var.teju[count.index]
  }
}

variable "teju" {
    type = list(string)
    default = [ "ammu" , "banda" ]

}