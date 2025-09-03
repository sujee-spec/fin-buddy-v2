terraform {
  backend "s3" {
    bucket = "sujeet-fin-buddy-s3"
    key    = "root/workload-ou/production/terraform.tfstate"
    region = "ap-south-1"
  }
}
