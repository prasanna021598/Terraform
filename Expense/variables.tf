# ec2 variables

variable "image_id" {
    default = "ami-090252cbe067a9e58"
    type = string
}

variable "instance_type" {
    default = "t2.large"
    type = string
}

variable "common_tags" {
  default = {
    Environment = "AWS Terraform"
    Project     = "Expense Project"
    Terraform = "True"

    // Add more tags as needed
  }
}

variable "instance_name" {
  type = string
  default = "DB"
}
variable "instance_names" {
    type = list
    default = [ "DB" , "Backend" , "Frontend"]
}


#route53 record variables
variable "zone_id" {
  default = "Z07069213ORGBTZ0ROKOX"
}


variable "domain_name" {
  default = "itindustry.online"
  
}
