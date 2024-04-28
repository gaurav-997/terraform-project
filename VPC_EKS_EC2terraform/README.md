# here we are creating VPC and Autoscalable EKS cluster on it  ( min nodes = 2 max nodes = 6 )
1 : Create a VPC , via module from documentation it will take the VPC ID automatically for public subnet , private subnet , IGW 
2: Create 2 public subnet 
3 : create 2 private subnet
4 : Enble IGW to get internet access  
5 : route Tables for public subnet ( CIDR block)
Create EKS in private subnet via module :- 
EKS cluster is eks_managed that will by default implement Auto scaling group 
here we have min 2 nodes and that can scale upto 6 nodes 
Implement the security group 