# resource "aws_internet_gateway" "_1-igw" {
#   for_each = var.australia-subnets
#   vpc_id   = aws_vpc.australia-vpc.id
#   provider = aws.australia
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_2-igw" {
#   for_each = var.california-subnets
#   vpc_id   = aws_vpc.california-vpc.id
#   provider = aws.california
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_3-igw" {
#   for_each = var.hong-kong-subnets
#   vpc_id   = aws_vpc.hong-kong-vpc.id
#   provider = aws.hong-kong
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_4-igw" {
#   for_each = var.london-subnets
#   vpc_id   = aws_vpc.london-vpc.id
#   provider = aws.london
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_5-igw" {
#   for_each = var.new-york-subnets
#   vpc_id   = aws_vpc.new-york-vpc.id
#   provider = aws.new-york
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_6-igw" {
#   for_each = var.sao-paulo-subnets
#   vpc_id   = aws_vpc.sao-paulo-vpc.id
#   provider = aws.sao-paulo
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# resource "aws_internet_gateway" "_7-igw" {
#   for_each = var.tokyo-subnets
#   vpc_id   = aws_vpc.tokyo-vpc.id
#   provider = aws.tokyo
#   tags = {
#     Name = "_1-igw-${each.key}"
#   }
# }

# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc


resource "aws_internet_gateway" "australia-igw" {
  vpc_id   = aws_vpc.australia-vpc.id
  provider = aws.australia
  tags = {
    Name = var.vpcs.australia.name
  }
}

resource "aws_internet_gateway" "california-igw" {
  vpc_id   = aws_vpc.california-vpc.id
  provider = aws.california
  tags = {
    Name = var.vpcs.california.name
  }
}

resource "aws_internet_gateway" "hong-kong-igw" {
  vpc_id   = aws_vpc.hong-kong-vpc.id
  provider = aws.hong-kong
  tags = {
    Name = var.vpcs.hong-kong.name
  }
}

resource "aws_internet_gateway" "london-igw" {
  vpc_id   = aws_vpc.london-vpc.id
  provider = aws.london
  tags = {
    Name = var.vpcs.london.name
  }
}

resource "aws_internet_gateway" "new-york-igw" {
  vpc_id   = aws_vpc.new-york-vpc.id
  provider = aws.new-york
  tags = {
    Name = var.vpcs.new-york.name
  }
}

resource "aws_internet_gateway" "sao-paulo-igw" {
  vpc_id   = aws_vpc.sao-paulo-vpc.id
  provider = aws.sao-paulo
  tags = {
    Name = var.vpcs.sao-paulo.name
  }
}

resource "aws_internet_gateway" "tokyo-igw" {
  vpc_id   = aws_vpc.tokyo-vpc.id
  provider = aws.tokyo
  tags = {
    Name = var.vpcs.tokyo.name
  }
}

# # aws_vpc.australia-vpc
# # aws_vpc.california-vpc
# # aws_vpc.hong-kong-vpc
# # aws_vpc.london-vpc
# # aws_vpc.new-york-vpc
# # aws_vpc.sao-paulo-vpc
# # aws_vpc.tokyo-vpc