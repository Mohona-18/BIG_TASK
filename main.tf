provider "aws" {
    region = "us-east-2"
	
}

resource "aws_instance" "ec2-instance" {
    ami = "ami-0ccabb5f82d4c9af5"
    instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0a38294eb1f8c2ac6"]
	subnet_id="subnet-034db6680b397c28a"
	  key_name      = "win-demo-kp-1"
	  tags= {
	  Name= "Linux_Instance_Terraform"
	  }
	  
}
