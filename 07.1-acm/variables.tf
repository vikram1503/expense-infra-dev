variable "project_name" {
    default = "expense"
  
}

variable "environment" {
    default = "dev"
  
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        component = "web-alb"
    }
  
}

variable "zone_name" {
    default = "imvicky.online"
  
}

variable "zone_id" {
    default = "Z01109981TZN8CSWE7N4F"
  
}