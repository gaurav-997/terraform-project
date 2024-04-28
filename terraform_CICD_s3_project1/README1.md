<<<<<<< HEAD
# terraform_CICD_S3website_project1
=======
1. Create a EC2 instance and lauch Jenkins on it 
2. Install docker in EC2 instance
sudo apt-get update
sudo apt-get install docker.io -y
docker version
sudo usermod -aG docker ubuntu  ( add docker to ubuntu usergroup)
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker ps

3. create a sonarqube container
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
docker ps

4. Install Trivy
vi trivy.sh
# content of script 
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y

bash trivy.sh

trivy --version

5. Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

terraform --version
which terraform    ( it will give path of terraform )

Configure Java and Terraform in Global Tool Configuration
Goto Manage Jenkins → Tools →
Java :-  JDK installation >> Name( java17) , install automatically , Install from adoptim.net , select JDK latest version ( jdk-17.0.8.1+1)
Terraform :- Terraform installation >> Name :- terraform , Install directory :- take path from which terraform ( /usr/bin ) , dont select install automatically 
Save  & apply it  

6. Install plugins in Jenkins
1 → Eclipse Temurin Installer (Java pluging , Install without restart)
2 → SonarQube Scanner (Install without restart)
3 → Terraform

7. Configure Sonar Server in Manage Jenkins
Grab the Public IP Address of your EC2 Instance, Sonarqube works on Port 9000, so <Public IP>:9000. Goto your Sonarqube Server. Click on Administration → Security → Users → Click on Tokens and Update Token → Give it a name ( jenkins ) → and click on Generate Token >> copy Token

Goto Jenkins Dashboard → Manage Jenkins → Credentials → global >> kind (Secret Text ) , provide the secret code , ID( sonar-token ) , Description ( sonar-token )

8. Now, go to Jekins Dashboard → Manage Jenkins → System >> sonar qube server 
name ( sonar-server ) , server url with port 9000 , auth ( Sonar-token) >> apply & save 

9. Configure SonarQube in Global Tool Configuration
Goto Manage Jenkins → Tools →SonarQube Scanner 
name ( sonar-scanner) , Install automatically with latest version , Apply and save 

10. Add the webhook in sonar dashboard for quality gates (for jenkins,sonar communincation )
go to sonar dashboard >> Administration–> Configuration–>Webhooks >> create >> Name( Jenkins) , URL ( IP with port of Jenkins dashboard http://<jenkins-ip>:8080/sonarqube-webhook/ ) >> create ( leave the secret empty )

>>>>>>> b390ebd (readme)
