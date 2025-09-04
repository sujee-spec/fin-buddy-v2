terraform {
  backend "s3" {
    bucket = "sujeet-fin-buddy-staging-bucket"
    key    = "staging/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
