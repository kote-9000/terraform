provider "aws" {
    region = "us-east-1"
  
}


resource "aws_key_pair" "dev" {
    key_name = "teju"
    public_key = file("~/.ssh/id_rsa.pub")
  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/16"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
  
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
  
}

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.myvpc.id


  route {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "RTS" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.RT.id

}

resource "aws_security_group" "webSG" {
    name = "web"
    vpc_id = aws_vpc.myvpc.id

    ingress {
        description = "HTTP from vpc"
        from_port = 80
        to_port =80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =["0.0.0.0/0"] 

    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks =["0.0.0.0/0"]
    }
  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "server" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"
    key_name = aws_key_pair.dev.key_name
    vpc_security_group_ids = [aws_security_group.webSG.id]
    subnet_id = aws_subnet.subnet.id
    tags = {
      Name ="provisioner"
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }

    #local execution process
    provisioner "local-exec" {
        command = "touch file500"
      
    }
     # file provisioner copy from local to remote
     provisioner "file" {
        source =  "file10"
        destination ="/home/ec2-user/file10"
       
     }
     #remote execution process
     provisioner "remote-exec" {
       inline = [ 
        "touch file200",
        "echo hai from teju >> file200",
        ]
     }

}