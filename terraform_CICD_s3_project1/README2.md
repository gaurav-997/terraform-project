11. create an IAM Roles, S3 bucket and Dynamo DB table.
IAM ROLE :- AWS services , service or use case ( EC2) , permissions policies (AmazonEC2FullAccess , AmazonS3FullAccess, AmazonDynamoDBFullAccess) ,Role name( Jenkins-cicd )  >> create role 

Attach this Role ( jenkins-cicd ) to our EC2 instance :- instance –> Actions –> Security –> Modify IAM role -> select Jenkins-cicd role and Update IAM role 

S3 Bucket :- Name(gaurav-cicd) , Block public access >> create Bucket 
Dynamo DB :- Tables >> create tables >> 
Name( gaurav-dynamo-db-table) , PartionID (LockID)

12. Install Docker Plugins { Docker , Docker Commons , Docker Pipeline , Docker API , docker-build-step } 

Under tool section add the Docker installation plugin ( Name :- docker , install automaticly , docker version :- latest  ) >> Apply and save 

Under credentials :- system >> Global credentials >> Kind ( username and password ) , username and password ( provide docker hub details ) , ID & description ( docker)

13. start TF code 
14. Add ubuntu user to sudo group 
sudo usermod -aG sudo ubuntu
sudo apt update