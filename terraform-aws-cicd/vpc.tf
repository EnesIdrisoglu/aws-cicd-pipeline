module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "3.11.5"
  name           = "test_ecs_provisioning"
  cidr           = "10.0.0.0/16"
  azs            = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
  tags = {
    "env"       = "dev"
    "createdBy" = "enes"
  }

}

data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}