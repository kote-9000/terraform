variable "ami-id" {
    type = string
    default = "ami-01376101673c89611"
    description = "passing ami value to main"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "passing instance value to main"
  
}

variable "key_name" {
    type = string
    default = "ks"
    description = "passing key value to main"
  
}