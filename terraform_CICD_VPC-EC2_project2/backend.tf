# terraform {
#   backend "s3" {
#     bucket = "mybucket"  
#     key    = "terraform.tfstate"   
#     region = "us-east-1"
#     dynamodb_table = "TF-locking"  
#     encrypt        = true
#   }
# }