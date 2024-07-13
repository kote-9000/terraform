# Create VPC and attach to IG
resource "aws_vpc" "teju" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name ="custom_vpc"
  }
}

# Create IG and attach to VPC
resource "aws_internet_gateway" "teju" {
    vpc_id = aws_vpc.teju.id
    tags = {
      Name ="cust_ig"
    }
}

#Create public subnet
resource "aws_subnet" "teju" {
    vpc_id = aws_vpc.teju.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
  tags = {
    Name = "cust_subnet_pub"
  }
}

#Create Route table
resource "aws_route_table" "teju" {
  vpc_id = aws_vpc.teju.id
  tags = {
    Name = "cust_pub_rt"
  }
  route {
    cidr_block ="0.0.0.0/0"
    gateway_id = aws_internet_gateway.teju.id
  }
}

resource "aws_route_table_association" "teju" {
    subnet_id = aws_subnet.teju.id
    route_table_id = aws_route_table.teju.id
}

resource "aws_security_group" "teju" {
  vpc_id = aws_vpc.teju.id
  name = "allow_traffic"
  description = "ALLOW TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "teju_sg"
  }
  ingress {
    description = "TLS from vpc"
    from_port = 80
    to_port = 80
    protocol ="tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  egress {
    from_port=0
    to_port = 0
    protocol = "-1"
    cidr_blocks =["0.0.0.0/0"]
  }
}

# EC2 insance creation on custom network
resource "aws_instance" "teju" {
  ami = "ami-01376101673c89611"
  instance_type = "t2.micro"
  key_name = "ks"
  vpc_security_group_ids = [aws_security_group.teju.id]
  subnet_id = aws_subnet.teju.id
  availability_zone = "ap-south-1a"
  associate_public_ip_address = true
  tags = {
    Name="teju-ec2"
  }
  
}
