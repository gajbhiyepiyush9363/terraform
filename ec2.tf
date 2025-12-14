resource "aws_default_vpc" "default" {}

resource "aws_security_group" "terrasecurity" {
  name        = "allow-ssh"
  description = "Allow SSH access"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-093434380a6d5b8a3" # manually copy default subnet ID here
  vpc_security_group_ids = [aws_security_group.terrasecurity.id]

  tags = {
    Name = "terraform-ec2-instance"
  }
}
