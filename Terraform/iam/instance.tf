
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_aws_key.key_name
  iam_instance_profile = aws_iam_instance_profile.s3-bucket-role-instance-profile.name
  tags = {
    Name = "HelloWorld"
  }
}

output "public_ip" {
    value = aws_instance.web.public_ip 
}