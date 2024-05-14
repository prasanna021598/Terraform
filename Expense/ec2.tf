
resource "aws_instance" "expense" { 
  #count = 3
  count = length(var.instance_names)
  ami           = var.image_id                                                                           # ami id is that which i am using as devops-practice , so this is not created by me , that is the ami we have to use for creating instances
  instance_type = var.instance_names[count.index] == "DB" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.teraformgroup.id]
  tags = merge(
    var.common_tags ,
    {
    Name = var.instance_names[count.index],
    Module = var.instance_names[count.index]
  }
  )
}


resource "aws_security_group" "teraformgroup" {
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
  
}