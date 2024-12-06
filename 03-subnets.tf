resource "aws_subnet" "_1" {
  for_each          = var.australia-subnets
  provider          = aws.australia
  vpc_id            = aws_vpc.australia-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}
resource "aws_subnet" "_2" {
  for_each          = var.california-subnets
  provider          = aws.california
  vpc_id            = aws_vpc.california-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_3" {
  for_each          = var.hong-kong-subnets
  provider          = aws.hong-kong
  vpc_id            = aws_vpc.hong-kong-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_4" {
  for_each          = var.london-subnets
  provider          = aws.london
  vpc_id            = aws_vpc.london-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_5" {
  for_each          = var.new-york-subnets
  provider          = aws.new-york
  vpc_id            = aws_vpc.new-york-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_6" {
  for_each          = var.sao-paulo-subnets
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc.sao-paulo-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "_7" {
  for_each          = var.tokyo-subnets
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo-vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}
