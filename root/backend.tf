terraform {
  backend "s3" {
    bucket = "sujeet-fin-buddy-s3"
    key    = "root/terraform.tfstate"
    region = "ap-south-1"
  }
}
