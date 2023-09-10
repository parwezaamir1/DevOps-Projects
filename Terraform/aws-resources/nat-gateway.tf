# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
resource "aws_eip" "eip_for_nat_gateway_az1" {
  domain = "vpc" #Indicates if this EIP is for use in VPC

  tags = {
    Name = "eip_for_nat_gateway_az1"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az2
resource "aws_eip" "eip_for_nat_gateway_az2" {
  domain = "vpc" #Indicates if this EIP is for use in VPC

  tags = {
    Name = "eip_for_nat_gateway_az2"
  }
}

# create nat gateway in public subnet az1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "nat_gateway_az1"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  depends_on = [aws_internet_gateway.igw]
}

# create nat gateway in public subnet az2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "nat_gateway_az2"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc.
  depends_on = [aws_internet_gateway.igw]
}