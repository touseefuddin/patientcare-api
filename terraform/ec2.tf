resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name

  user_data              = file("${path.module}/userdata.sh")

  tags = {
    Name = "PatientCareAppInstance"
  }
}
