# Use documentation for all these content  
Use data sources to fetch AMI ID , here owner and name we get from AWS GUI as per AMI we want 
create SSH key ( ssh-keygen -t rsa )
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/gaugaura/.ssh/id_rsa): ./id_rsa

create security group with ingress and egress 
create EC2 instance with above SSH key , SG 
Install nginx ( we will prefer user data)
add "hey Gaurav, How are you" in file :-  /var/www/html/index.html 
Manually open the browser and paste the public IP of EC2 , to check above index.html 

# learning 
1. Fetching the AMI using data resources, not hardcoding it 
2. Applying the ingress and egress SG rules
3. Creating EC2 
4. Using the Env varibales to manage the secrets 
5. Installing any application 
6. How to use a file content in terraform code
7. various terraform commands :- fmt , validate , init , plan , apply 
8. use of tfvar & tfstate file ,graphs , variables , workspaces 
9. Fixing a terraform version 