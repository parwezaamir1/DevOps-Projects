# Using data source
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# creating ec2-instaances

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  # the VPC subnet
  subnet_id = aws_subnet.public_subnet_az1.id

  # the security group
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]
  # security_groups = ["${aws_security_group.terraform-sg.name}"]

  tags = {
    Name = "Hello-Ec2"
  }

  user_data = file("${path.module}/script.sh")
  # user_data = <<-EOF
  # #!bin/bash
  #sudo apt-get update -y
  #sudo apt-get install nginx -y
  #sudo systemctl start nginx
  #sudo systemctl enable nginx
  #sudo echo "Hello Altamash" > /var/www/index.nginx-debian.html
  #EOF

  #file, local-exex, remote-exec
  # provisioner "file" {
  #   source      = "readme.md"     # terraform source machine
  #   destination = "tmp/readme.md" # terraform remote machine

  #   connection {
  #     type = "ssh"
  #     user = "ubuntu"
  #     #private_key = file("${path.module}/id_rsa")
  #     private_key = file("~/.ssh/id_rsa")
  #     host        = self.public_ip
  #   }

  # }
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    size              = 20
    type              = "gp2"
    tags = {
      Name = "extra volume data"
    }
  }
 
  resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id   = aws_ebs_volume.ebs-volume-1.id
    instance_id = aws_instance.web.id
  }

