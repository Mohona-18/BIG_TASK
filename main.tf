provider "aws" {
    region = "us-east-2"
	
}
resource "aws_network_interface" "test" {
  subnet_id="subnet-0d842abdd2ea9335f"
  tags = {
    Name = "primary_network_interface"
  }
}
resource "aws_instance" "ec2-instance" {
    ami = "ami-0ccabb5f82d4c9af5"
    instance_type = "t2.micro"
    network_interface {
    network_interface_id = aws_network_interface.test.id
    device_index         = 0
    }


	  key_name      = "win-demo-kp-1"
	  tags= {
	  Name= "Linux_Instance_Terraform"
	  }
	  
}
