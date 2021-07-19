resource "aws_instance" "ubuntu-xenial" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}

