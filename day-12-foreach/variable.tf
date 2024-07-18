variable "ami_id" {
    default = "ami-0ec0e125bb6c6e8ec"
    type = string
  
}

variable "instance_type" {
    default = "t2.micro"
    type = string
  
}

variable "key_name" {
    default = "ks"
    type = string
  
}

variable "teju" {
    default = ["teju","banda"]
    type = list(string)
  
}