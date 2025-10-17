resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.all-allow-tf.id] 

  tags = {
    Name = "mongodb"
  }
}

resource "aws_security_group" "all-allow-tf" {

  name = "all-allow-tf"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["10.0.0.0/8"]
  }

  tags = {
    Name = "tf-allow-all"
  }
}