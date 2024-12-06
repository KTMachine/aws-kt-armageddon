resource "aws_vpc" "tokyo-vpc" {
  cidr_block = var.vpcs.tokyo.cidr
  provider   = aws.tokyo
  tags = {
    Name = var.vpcs.tokyo.name
  }
}

resource "aws_vpc" "new-york-vpc" {
  cidr_block = var.vpcs.new-york.cidr
  provider   = aws.new-york
  tags = {
    Name = var.vpcs.new-york.name
  }
}

resource "aws_vpc" "london-vpc" {

  cidr_block = var.vpcs.london.cidr
  provider   = aws.london
  tags = {
    Name = var.vpcs.london.name
  }
}

resource "aws_vpc" "sao-paulo-vpc" {

  cidr_block = var.vpcs.sao-paulo.cidr
  provider   = aws.sao-paulo
  tags = {
    Name = var.vpcs.sao-paulo.name
  }
}

resource "aws_vpc" "australia-vpc" {

  cidr_block = var.vpcs.australia.cidr
  provider   = aws.australia
  tags = {
    Name = var.vpcs.australia.name
  }
}

resource "aws_vpc" "hong-kong-vpc" {

  cidr_block = var.vpcs.hong-kong.cidr
  provider   = aws.hong-kong
  tags = {
    Name = var.vpcs.hong-kong.name
  }
}

resource "aws_vpc" "california-vpc" {

  cidr_block = var.vpcs.california.cidr
  provider   = aws.california
  tags = {
    Name = var.vpcs.california.name
  }
}

# - Tokyo.
# - New York
# - London
# - Sao Paulo
# - Australia 
# - Hong Kong
# - California

