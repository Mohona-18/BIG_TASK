variable "ec2_ebs_volume_count" {
  default = 3
}
variable "ec2_device_names" {
  default = [
    "/dev/sdm",
    "/dev/sdn",
    "/dev/sdo",
  ]
}
variable "instance_type"{
  default = "t2.micro"
}
variable "volume_size"{
  default = 8
}
