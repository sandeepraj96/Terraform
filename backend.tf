# terraform {
#   backend "s3" {
#     bucket = "s3buck27112024sandy"
#     key    = "state/terraform.tfstate"
#     region = "ap-south-1"
#     #   encrypt        = true
#     #  #  kms_key_id     = "alias/terraform-bucket-key"
#     dynamodb_table = "dynamodb"
#   }
# }