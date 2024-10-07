#configuration of aws provider
provider "aws" {
    region = var.region
    profile = "Jeel"
}

#creation of a 3tiers vpc via a module
module "vpc" {
  source = "../Module/My-vpc"
region                              = var.region
vpc_cidr                            = var.vpc_cidr
my_project_title                    = var.my_project_title
pub_sn_az1_cidr                     = var.pub_sn_az1_cidr
pub_sn_az2_cidr                     = var.pub_sn_az2_cidr
priv_application_tier_sn_az1_cidr   = var.priv_application_tier_sn_az1_cidr
priv_application_tier_sn_az2_cidr   = var.priv_application_tier_sn_az2_cidr
priv_data_tier_sn_az1_cidr          = var.priv_data_tier_sn_az1_cidr
priv_data_tier_sn_az2_cidr          = var.priv_data_tier_sn_az2_cidr
}