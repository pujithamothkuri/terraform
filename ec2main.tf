module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-0a5eb27a14ccd2df8"]
  subnet_id              = "subnet-0d8bfaf0873ea77c6"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
