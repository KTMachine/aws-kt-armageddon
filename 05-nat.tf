resource "aws_eip" "tokyo-nat" {
  provider = aws.tokyo
  domain   = "vpc"

  tags = {
    Name = "${var.vpcs.tokyo.name}-eip"
  }
}

resource "aws_nat_gateway" "tokyo-nat" {
  provider      = aws.tokyo
  allocation_id = aws_eip.tokyo-nat.id
  subnet_id     = aws_subnet._7["tokyo-a-private"].id

  tags = {
    Name = "${var.vpcs.tokyo.name}-nat"
  }
  # aws_internet_gateway.tokyo-igw
  depends_on = [aws_internet_gateway.tokyo-igw]
}




# resource "aws_eip" "_1nat" {
#   for_each = var.australia-subnets
#   provider = aws.australia
#   domain   = "vpc"

#   tags = {
#     Name = each.value.vpc
#   }
# }

# resource "aws_nat_gateway" "_1nat" {
#   for_each      = var.australia-subnets
#   provider      = aws.australia
#   allocation_id = aws_eip._1nat[each.key].id
#   subnet_id     = aws_subnet._1[each.key].id

#   tags = {
#     Name = each.key
#   }
#   # aws_internet_gateway.australia-igw
#   depends_on = [aws_internet_gateway.australia-igw]
# }

# resource "aws_eip" "_7nat" {
#   for_each = var.tokyo-subnets
#   provider = aws.tokyo
#   domain   = "vpc"

#   tags = {
#     Name = each.value.vpc
#   }
# }

# resource "aws_nat_gateway" "_7nat" {
#   for_each      = var.tokyo-subnets
#   provider      = aws.tokyo
#   allocation_id = aws_eip._7nat[each.key].id
#   subnet_id     = aws_subnet._7[each.key].id

#   tags = {
#     Name = each.key
#   }
#   # aws_internet_gateway.tokyo-igw
#   depends_on = [aws_internet_gateway.tokyo-igw]
# }



# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc

# aws_subnet._1["tokyo-a-private"]
# aws_subnet._1["tokyo-a-public"]
# aws_subnet._1["tokyo-d-private"]
# aws_subnet._1["tokyo-d-public"]
# aws_subnet._1["tokyotest-c-public"]

# aws_subnet._2["london-a-public"]
# aws_subnet._2["london-b-public"]

# aws_subnet._3["sao-paulo-a-public"]
# aws_subnet._3["sao-paulo-c-public"]

# aws_subnet._4["australia-a-public"]
# aws_subnet._4["australia-b-public"]

# aws_subnet._5["hong-kong-a-public"]
# aws_subnet._5["hong-kong-b-public"]

# aws_subnet._6["california-a-public"]
# aws_subnet._6["california-b-public"]

# aws_subnet._7["new-york-a-public"]
# aws_subnet._7["new-york-b-public"]


# resource "aws_subnet" "_1" {
#   for_each          = var.tokyo-subnets
#   provider          = aws.tokyo
#   vpc_id            = aws_vpc.tokyo-vpc.id
#   cidr_block        = each.value.cidr
#   availability_zone = each.value.az

#   tags = {
#     Name = each.key
#   }
# }

