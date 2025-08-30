resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  tags = { 
    Name = "${local.project}-vpc" 
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { 
    Name = "${local.project}-igw"
     }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block
  tags = { 
    Name = "${local.project}-public-subnet"
     }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = { 
    Name = "${local.project}-public-rt" 
    }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
