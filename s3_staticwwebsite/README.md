    1. Create S3 bucket :- Provider.tf >> main.tf >> variable.tf
    2. create a basic index.html and error.html ( means when any error will come user will be redirected to this page ) 
    3. Make the bucket Public and enable static website hosting enable in main.tf 
    4. Upload the index.html and error.html
    5. Host website on s3
    6. Terraform init >> terraform plan >> terraform apply >> terraform destroy 
Get the website link from aws GUI >> s3 >> properties have website link 