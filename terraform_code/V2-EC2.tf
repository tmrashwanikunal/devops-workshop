provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"
    key_name = "dpp"
    security_groups = [ "demo-sg" ]
}

resource "aws_security_group" "demo-sg" {
    name = "demo-sg" 
    description = "Demo Sg creation using terraform" 

    ingress {
        description = "SSH access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
      name = "ssh-port"
    }
}