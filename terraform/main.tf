
# ==========================================
# 1. CREATE VPC
# ==========================================

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name}-vpc"
    Project = var.project_name
  }
}


# ==========================================
# 2. CREATE PUBLIC SUBNET
# ==========================================

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.project_name}-public-subnet"
    Project = var.project_name
  }
}


# ==========================================
# 3. CREATE INTERNET GATEWAY
# ==========================================

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "${var.project_name}-igw"
    Project = var.project_name
  }
}


# ==========================================
# 4. CREATE PUBLIC ROUTE TABLE
# ==========================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "${var.project_name}-public-rt"
    Project = var.project_name
  }
}


# ==========================================
# 5. ASSOCIATE ROUTE TABLE WITH SUBNET
# ==========================================

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


# ==========================================
# 6. CREATE APPLICATION SECURITY GROUP
# ==========================================

resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow application and SSH traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH access from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    description = "Spring Boot application"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-sg"
    Project = var.project_name
  }
}

# ==========================================
# 7. IAM ROLE FOR APPLICATION EC2
# ==========================================

resource "aws_iam_role" "app_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name    = "${var.project_name}-ec2-role"
    Project = var.project_name
  }
}


# ==========================================
# 8. ATTACH ECR PERMISSIONS
# ==========================================

resource "aws_iam_role_policy_attachment" "ecr_access" {
  role = aws_iam_role.app_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}


# ==========================================
# 9. CREATE EC2 INSTANCE PROFILE
# ==========================================

resource "aws_iam_instance_profile" "app_profile" {
  name = "${var.project_name}-instance-profile"
  role = aws_iam_role.app_role.name
}


# ==========================================
# 10. CREATE APPLICATION EC2 INSTANCE
# ==========================================

resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.app_profile.name
  associate_public_ip_address = true

  root_block_device {
    volume_size = 12
    volume_type = "gp3"
  }

  tags = {
    Name    = "${var.project_name}-app-server"
    Project = var.project_name
  }
}
resource "aws_iam_role_policy_attachment" "ssm_access" {
  role       = aws_iam_role.app_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}