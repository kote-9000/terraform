module "dev" {
    source = "../day-1"
    ami-id = var.ami
    instance_type = var.type
    key_name = var.key
  #source variable = module variable
}