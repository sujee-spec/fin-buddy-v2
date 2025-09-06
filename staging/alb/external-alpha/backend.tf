terraform {
  backend "s3" {
    bucket = "sujeet-fin-buddy-staging-bucket"
    key    = "staging/alb/external-alpha/terraform.tfstate"
    region = "ap-south-1"
  }
}
