
terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-535268269273"
    key    = "sprint1/week2/training-terraform/terraform.tfstates"
    dynamodb_table = "terraform-lock"

  }
}
