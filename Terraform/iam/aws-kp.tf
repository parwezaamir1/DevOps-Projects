# creating Key-pair
resource "aws_key_pair" "my_aws_key" {
  key_name = var.key_name
  #public_key = file("${path.module}/id_rsa.pub") ---use this if pub key is at the working dir
  public_key = file("~/.ssh/id_rsa.pub")
}