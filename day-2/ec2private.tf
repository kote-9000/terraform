# Create private subnet and attach to NAT
resource "aws_subnet" "test" {
  vpc_id = aws_vpc.teju.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name="cust-private-sub"
  }
  
}
# Create NAT
resource "aws_nat_gateway" "test" {
  subnet_id = aws_subnet.test.id
  connectivity_type = "private"

}
resource "aws_route_table" "test" {
  vpc_id = aws_vpc.teju.id
  tags = {
    Name="private-rt-2"
  }
route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.test.id
}
}

resource "aws_route_table_association" "test" {
  subnet_id = aws_subnet.test.id
  route_table_id = aws_route_table.test.id
  
}

resource "aws_instance" "test" {
  ami = "ami-01376101673c89611"
  instance_type = "t2.micro"
  key_name = "ks"
  vpc_security_group_ids = [aws_security_group.teju.id]
  subnet_id = aws_subnet.test.id
  tags = {
    Name= "private-ec2"
  }
}