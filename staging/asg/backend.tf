terraform {
  backend "s3" {
    bucket = "sujeet-fin-buddy-staging-bucket"
    key    = "staging/asg/terraform.tfstate"
    region = "ap-south-1"
  }
}
