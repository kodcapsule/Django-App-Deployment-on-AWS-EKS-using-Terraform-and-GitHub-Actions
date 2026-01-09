resource "aws_instance" "web_server" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t3.micro"
  security_groups        = [aws_security_group.allow-http.name]
  

  # User data script to install and start a web server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from   EC2 Instance!!!!</h1>" > /var/www/html/index.html
              EOF

  # Root volume configuration
  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  tags = {    
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}


resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "Allow HTTP inbound traffic"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}