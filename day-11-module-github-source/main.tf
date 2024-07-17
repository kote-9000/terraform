module "git" {
  source = "github.com/kote-9000/terraform/day-1"
  ami-id = "ami-0ec0e125bb6c6e8ec"
  instance_type ="t2.micro"
  key_name ="ks"
}