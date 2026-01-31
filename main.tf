provider "aws" {
 
}
# creating secgreity guoup 
resource "aws_security_group" "sg" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami                    = "ami-019715e0d74f695be"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  user_data = <<-EOF
#!/bin/bash
set -e

apt-get update -y
apt-get install -y apache2 git

systemctl start apache2
systemctl enable apache2

cd /var/www/html
rm -rf *

git clone https://github.com/manojgk0210-hue/Portfolio.git  #change this repo url to your url ok.  make shor index.html page
cp -r Portfolio/. /var/www/html/

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

systemctl restart apache2
EOF



  tags = {
    Name = "apache-web-server"
  }
}

# Output variable: Public IP address
output "public_ip" {
  value = aws_instance.example.public_ip
}
