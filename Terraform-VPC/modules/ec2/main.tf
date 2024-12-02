resource "aws_instance" "web" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnets[count.index]
  associate_public_ip_address = true
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data = <<EOF
  #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2

    echo "Hello, Terraform!" > /var/www/html/index.html
  EOF
  tags = {
    Name = var.ec2_names[count.index]
  }
}
