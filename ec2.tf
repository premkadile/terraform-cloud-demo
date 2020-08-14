provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "tf_demo_sg" {
  name   = "tf-demo-${var.env}-sg"
  vpc_id = data.aws_vpc.tf_demo_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


## retool instance
resource "aws_instance" "tfdemo_instance" {
  ami                        = data.aws_ami.amazon_linux_2.id
  instance_type              = "t3.micro"
  key_name                   = "ntesttf"
  vpc_security_group_ids     = [aws_security_group.tf_demo_sg.id]
  subnet_id                  = "subnet-0d8b712f15c8e10bc"
  source_dest_check          = "false"
  iam_instance_profile       = "session-manager"
  root_block_device {
  volume_size                = "20"
  }
  volume_tags                = {
    Name = "tf-demo-${var.env}"
    Environment = var.env  
  }
  tags = {
    Name = "tf-demo-${var.env}"
    Environment = var.env
  }
}


##eip
resource "aws_eip" "tfdemo_eip" {
  instance = aws_instance.tfdemo_instance.id
  vpc      = true

}



