provider "aws" {
    region = "us-east-2"
	
}
resource "aws_network_interface" "test" {
  subnet_id=aws_subnet.private_subnet.id
  tags = {
    Name = "primary_network_interface"
  }
}
resource "aws_vpc" "Terraform_vpc"{ 
 cidr_block = "10.0.0.0/16"
 tags = {
   Name = "Terraform_VPC"
 }
}
resource "aws_subnet" "private_subnet" {
 vpc_id     = aws_vpc.Terraform_vpc.id
 cidr_block = "10.0.4.0/24"
 
 tags = {
   Name = "Private Subnet 1"
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
resource "aws_ebs_volume" "ebs_volume" {
  count             = "${var.ec2_ebs_volume_count}"
  availability_zone = "us-east-2c"
  size              = "8"
}

resource "aws_volume_attachment" "volume_attachement" {
  count       = "${var.ec2_ebs_volume_count}"
  device_name = "${element(var.ec2_device_names, count.index)}"
  volume_id   = "${aws_ebs_volume.ebs_volume.*.id[count.index]}"
  instance_id = "${element(aws_instance.ec2-instance.*.id, count.index)}"
}
