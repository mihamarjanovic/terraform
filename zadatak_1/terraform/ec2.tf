resource "aws_instance" "controller" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.controller_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.jenkins_key.key_name
  user_data                   = templatefile("${path.module}/../data_scripts/jankins_controller.sh", {})

  tags = { 
    Name = local.controller_name
    Description = "Jenkins controller instance"
    CostCentar = var.cost_centar
     }
}

resource "aws_instance" "node" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.node_sg.id]

  tags = {
    Name = local.node_name
    Description = "Jenkins node instance"
    CostCentar = var.cost_centar
    }
}