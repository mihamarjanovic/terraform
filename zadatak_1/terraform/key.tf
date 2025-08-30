resource "aws_key_pair" "jenkins_key" {
  key_name   = "${local.project}-key-name"
  public_key = var.public_ssh_key
}