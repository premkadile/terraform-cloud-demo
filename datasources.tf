data "aws_vpc" "tf_demo_vpc" {
  tags = {
    Name = "main_vpc"
  }
}

data "aws_subnet_ids" "tf_demo_subnet" {
  vpc_id = data.aws_vpc.tf_demo_vpc.id

  tags = {
    Name = "tf-demo-public"
  }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = "true"

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}


