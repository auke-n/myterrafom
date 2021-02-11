provider "aws" {
  region  = "eu-central-1"
  shared_credentials_file = "%USERPROFILE%.aws/credentials"
  profile = "default"
}