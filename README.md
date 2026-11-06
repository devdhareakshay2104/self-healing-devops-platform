# 🚀 Self-Healing Cloud Infrastructure & Automated Deployment Platform

## 1. Project Overview

The **Self-Healing Cloud Infrastructure & Automated Deployment Platform** is an end-to-end DevOps project designed to automate application development, infrastructure provisioning, CI/CD, configuration management, deployment, monitoring, failure detection, and application recovery using AWS and DevOps tools.

The main objective is to build an automated deployment platform where developers push application code to GitHub and the CI/CD pipeline handles the build, testing, containerization, and deployment process.

The platform is designed to monitor application health, detect failures, and perform automated recovery to improve application availability and reliability.

## 2. Project Objectives

- Automate application build and deployment.
- Provision AWS infrastructure using Terraform.
- Configure servers using Ansible.
- Containerize applications using Docker.
- Implement CI/CD using Jenkins.
- Store Docker images in AWS ECR.
- Monitor application health and logs using CloudWatch.
- Implement automatic application recovery.
- Implement automatic rollback for failed deployments.
- Send notifications for deployment failures and recovery events.
- Maintain infrastructure and application deployment through automation.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Java 21 | Application development |
| Spring Boot 4 | REST API development |
| Maven | Build automation and dependency management |
| Git | Version control |
| GitHub | Source code management |
| Docker | Application containerization |
| Docker Compose | Container management |
| Jenkins | CI/CD automation |
| AWS EC2 | Application hosting |
| AWS VPC | Network infrastructure |
| AWS IAM | Access management |
| AWS ECR | Docker image repository |
| AWS Systems Manager | Secure EC2 management |
| Terraform | Infrastructure as Code |
| Ansible | Configuration management |
| AWS CloudWatch | Monitoring and logging (planned) |
| AWS SNS | Notifications (planned) |

## 4. Project Architecture

```text
                 Developer
                     |
                     v
               GitHub Repository
                     |
                     v
              Jenkins CI/CD Pipeline
                     |
                     v
              Maven Build and Testing
                     |
                     v
                Docker Build
                     |
                     v
                  AWS ECR
                     |
                     v
             Terraform Provisioning
                     |
                     v
                AWS EC2
                     |
                     v
             Ansible Configuration
                     |
                     v
            Docker Application Deployment
                     |
                     v
             CloudWatch Monitoring
                     |
                     v
          Self-Healing and Auto Recovery
                     |
                     v
              SNS Notifications
```

## 5. Project Implementation

### Phase 1: Java Application Development

**Objective:** Develop a Spring Boot application with health-check and version endpoints.

**Technologies:**
- Java 21
- Spring Boot 4
- Maven

#### Application Endpoints

| Endpoint | Description |
|---|---|
| `/` | Home endpoint |
| `/health` | Application health status |
| `/version` | Application version |
| `/actuator/health` | Spring Boot health monitoring |

#### Maven Commands

Compile the application:

```bash
mvn clean compile
```

Run unit tests:

```bash
mvn test
```

Package the application:

```bash
mvn clean package
```

Run the application:

```bash
mvn spring-boot:run
```

#### Application Configuration

```text
Application Name: self-healing-app
Server Port: 8080
Java Version: 21
```

#### Expected Health Response

```json
{
  "status": "UP",
  "application": "self-healing-app"
}
```

**Status:** Completed.

---

### Phase 2: Docker Containerization and Jenkins CI/CD

**Objective:** Containerize the Spring Boot application and automate its build, testing, and deployment using Jenkins.

#### Technologies Used

- Docker
- Docker Compose
- Dockerfile
- Jenkins
- GitHub
- Maven
- Java 21
- AWS EC2

#### Docker Practical Implementations

1. Installed and configured Docker on AWS EC2.
2. Created a Dockerfile for the Spring Boot application.
3. Built Docker images.
4. Ran the application inside Docker containers.
5. Configured container port mapping.
6. Monitored containers using Docker logs and stats.
7. Implemented Docker health checks.
8. Created a multi-stage Docker build.
9. Managed the application using Docker Compose.
10. Configured container restart policies.

#### Docker Images

- `self-healing-app:v1`
- `self-healing-app:v2`
- `self-healing-app:v3`
- `self-healing-app:v4`

#### Jenkins CI/CD Pipeline

Created a Jenkins pipeline named:

```text
self-healing-devops-pipeline
```

Pipeline stages:

1. Checkout source code from GitHub.
2. Check Java environment.
3. Build and test the application using Maven.
4. Build Docker image.
5. Deploy application using Docker Compose.
6. Perform application health checks.

#### Important Docker Commands

```bash
docker images
docker ps -a

docker build -t self-healing-app:v1 .

docker run -d \
  --name self-healing-container \
  -p 8080:8080 \
  self-healing-app:v1

docker logs self-healing-container
docker stats self-healing-container
docker inspect self-healing-container

docker compose up -d --build
docker compose ps
docker compose logs
docker compose down
```

**Status:** Completed.

---

### Phase 3: AWS ECR Integration

**Objective:** Store Docker images in Amazon Elastic Container Registry (ECR) and integrate ECR with the Jenkins pipeline.

#### AWS Services Used

- Amazon ECR
- AWS IAM
- AWS EC2

#### ECR Repository

```text
Repository Name: self-healing-app

Region: us-east-1

Repository URI:
273804046923.dkr.ecr.us-east-1.amazonaws.com/self-healing-app
```

#### Practical Implementations

1. Created a private ECR repository.
2. Configured an IAM role for the Jenkins EC2 instance.
3. Attached ECR permissions to the IAM role.
4. Installed AWS CLI on the Jenkins EC2 instance.
5. Authenticated Docker with Amazon ECR.
6. Tagged Docker images with the ECR repository URI.
7. Pushed Docker images to ECR.
8. Integrated ECR image pushing into the Jenkins pipeline.

#### Important ECR Commands

Authenticate Docker with ECR:

```bash
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin \
273804046923.dkr.ecr.us-east-1.amazonaws.com
```

Tag Docker image:

```bash
docker tag self-healing-app:v4 \
273804046923.dkr.ecr.us-east-1.amazonaws.com/self-healing-app:v4
```

Push Docker image:

```bash
docker push \
273804046923.dkr.ecr.us-east-1.amazonaws.com/self-healing-app:v4
```

Verify ECR images:

```bash
aws ecr list-images \
--repository-name self-healing-app \
--region us-east-1
```

**Status:** Completed. Docker images were successfully pushed to ECR.

---

### Phase 4: AWS Infrastructure Provisioning Using Terraform

**Objective:** Automate AWS infrastructure provisioning using Terraform (Infrastructure as Code).

#### Technologies Used

- Terraform
- AWS Provider
- AWS VPC
- AWS EC2
- AWS IAM
- AWS Security Groups

#### Infrastructure Created

| AWS Resource | Description |
|---|---|
| VPC | Custom virtual private cloud |
| Public Subnet | Hosts application EC2 instance |
| Internet Gateway | Provides internet connectivity |
| Route Table | Routes internet traffic |
| Security Group | Controls inbound and outbound traffic |
| IAM Role | Grants AWS permissions to EC2 |
| IAM Instance Profile | Attaches IAM role to EC2 |
| EC2 Instance | Hosts the application |

#### Network Configuration

```text
VPC CIDR: 10.0.0.0/16

Public Subnet: 10.0.1.0/24

Availability Zone: us-east-1a

AWS Region: us-east-1
```

#### IAM Permissions

The application EC2 instance uses an IAM role with:

- AmazonEC2ContainerRegistryReadOnly
- AmazonSSMManagedInstanceCore

These permissions allow the EC2 instance to pull Docker images from ECR and register with AWS Systems Manager.

#### Terraform File Structure

```text
terraform/
│
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
└── .terraform.lock.hcl
```

Note: `.terraform/`, Terraform state files, and `terraform.tfvars` are excluded from Git using `.gitignore`.

#### Important Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Format configuration files:

```bash
terraform fmt
```

Validate configuration:

```bash
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

Display infrastructure outputs:

```bash
terraform output
```

#### Practical Implementations

1. Installed Terraform on Windows.
2. Configured AWS CLI credentials.
3. Configured the AWS Terraform provider.
4. Created a custom VPC and public subnet.
5. Created an Internet Gateway and route table.
6. Configured route table association.
7. Created an application security group.
8. Created an IAM role and instance profile.
9. Provisioned an Ubuntu EC2 instance.
10. Configured ECR read-only permissions.
11. Configured Systems Manager permissions.

**Status:** Infrastructure provisioned using Terraform.

---

### Phase 5: Ansible Configuration Management and Automated Deployment

**Objective:** Automate EC2 server configuration and application deployment using Ansible.

#### Technologies Used

- Ansible
- Ubuntu 24.04
- Windows Subsystem for Linux (WSL)
- OpenSSH
- AWS CLI v2
- Docker
- AWS ECR

#### Ansible Architecture

```text
        Ansible Control Node
             Ubuntu WSL
                  |
                  |
             SSH Connection
                  |
                  v
          AWS EC2 Managed Node
             Ubuntu 24.04
                  |
                  v
            Docker Installation
                  |
                  v
              AWS ECR
                  |
                  v
          Application Deployment
```

#### Control Node Configuration

Installed Ansible on Ubuntu WSL.

Commands:

```bash
sudo apt update

sudo apt install ansible openssh-client -y

ansible --version
```

#### SSH Key Configuration

Generated an ED25519 SSH key:

```bash
mkdir -p ~/.ssh

chmod 700 ~/.ssh

ssh-keygen -t ed25519 \
-C "ansible-self-healing-platform"
```

Displayed the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Configured SSH public-key access for the Ubuntu user on the Terraform-created EC2 instance.

Connected to EC2:

```bash
ssh -i ~/.ssh/id_ed25519 \
ubuntu@EC2_PUBLIC_IP
```

Note: The private SSH key is stored securely on the Ansible control node and is never committed to GitHub.

#### Ansible Project Structure

```text
ansible/
│
├── inventory.ini
├── install-docker.yml
└── deploy-app.yml
```

#### Inventory Configuration

The inventory file defines the target EC2 server.

Example:

```ini
[app_servers]
app_server ansible_host=EC2_PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/USERNAME/.ssh/id_ed25519
```

Replace the placeholders with your actual EC2 public IP and WSL username. Do not publish private keys or credentials.

#### Test Ansible Connectivity

```bash
ansible -i inventory.ini app_servers -m ping
```

Expected response:

```text
app_server | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

#### Docker Installation Using Ansible

Created `install-docker.yml` to automate:

1. Updating Ubuntu packages.
2. Installing Docker.
3. Starting the Docker service.
4. Enabling Docker at system startup.
5. Adding the Ubuntu user to the Docker group.
6. Verifying Docker installation.

Execute the playbook:

```bash
ansible-playbook -i inventory.ini install-docker.yml
```

Verify Docker:

```bash
ansible -i inventory.ini app_servers \
-b -m command -a "docker --version"
```

#### AWS CLI Installation and ECR Authentication

Created `deploy-app.yml` to automate:

1. Installing Docker, curl, and unzip.
2. Downloading AWS CLI v2.
3. Installing AWS CLI v2.
4. Starting and enabling Docker.
5. Authenticating Docker with AWS ECR using the EC2 IAM role.
6. Pulling the application image from ECR.
7. Removing an existing application container.
8. Running the application container.
9. Checking application health.

AWS CLI version verification:

```bash
aws --version
```

ECR authentication is performed using the EC2 IAM instance profile, avoiding the need to store AWS access keys on the application server.

#### Application Deployment

ECR repository:

```text
273804046923.dkr.ecr.us-east-1.amazonaws.com/self-healing-app
```

Application image:

```text
self-healing-app:v4
```

Application deployment uses Docker port mapping:

```text
EC2 Port: 8080
Container Port: 8080
```

Execute the deployment playbook:

```bash
ansible-playbook -i inventory.ini deploy-app.yml
```

Verify the running container:

```bash
ansible -i inventory.ini app_servers \
-b -m command -a "docker ps"
```

Verify application health:

```bash
ansible -i inventory.ini app_servers \
-b -m uri \
-a "url=http://localhost:8080/actuator/health status_code=200"
```

**Status:** Ansible control node, SSH connectivity, Docker automation, AWS CLI installation, and ECR authentication configured. Application deployment and health-check verification are part of the deployment validation.

---

### Phase 6: AWS CloudWatch Monitoring and Logging

**Objective:** Monitor AWS infrastructure and application performance using Amazon CloudWatch.

#### Planned Implementations

1. Install and configure CloudWatch Agent.
2. Monitor EC2 CPU utilization.
3. Monitor memory utilization.
4. Monitor disk usage.
5. Collect application logs.
6. Create CloudWatch alarms.
7. Configure monitoring dashboards.

**Status:** Planned.

---

### Phase 7: Self-Healing and Automatic Recovery

**Objective:** Implement automatic application failure detection and recovery.

#### Planned Implementations

1. Monitor application health endpoints.
2. Detect application failures.
3. Automatically restart unhealthy Docker containers.
4. Configure recovery scripts.
5. Implement automated deployment rollback.
6. Test failure and recovery scenarios.
7. Record recovery events.

**Status:** Planned.

---

### Phase 8: Notifications, Final Testing and Documentation

**Objective:** Complete the automated platform and validate the entire CI/CD and self-healing workflow.

#### Planned Implementations

1. Configure Amazon SNS email notifications.
2. Send deployment failure notifications.
3. Send recovery notifications.
4. Test the complete Jenkins pipeline.
5. Test infrastructure and application recovery.
6. Validate application availability.
7. Update project architecture documentation.
8. Complete the GitHub README.

**Status:** Planned.

## 6. Self-Healing Features

The platform is designed to implement the following features:

- Application health monitoring.
- Automatic container restart.
- Failure detection.
- Automated deployment rollback.
- Application recovery.
- Cloud infrastructure monitoring.
- Deployment notifications.
- Recovery event notifications.

Note: These features will be marked complete after their respective recovery and failure scenarios are implemented and tested.

## 7. Project Progress

- [x] Phase 1: Java Application Development
- [x] Phase 2: Docker Containerization and Jenkins CI/CD
- [x] Phase 3: AWS ECR Integration
- [x] Phase 4: AWS Infrastructure Provisioning Using Terraform
- [x] Phase 5: Ansible Configuration Management Setup
- [ ] Phase 5: Complete Application Deployment Verification
- [ ] Phase 6: AWS CloudWatch Monitoring and Logging
- [ ] Phase 7: Self-Healing and Automatic Recovery
- [ ] Phase 8: Notifications, Final Testing and Documentation

## 8. Project Goal

To build an end-to-end automated DevOps platform on AWS that minimizes manual deployment activities, improves application availability, automates infrastructure management, and provides automatic application failure recovery.

## 9. Future Enhancements

- Prometheus and Grafana for advanced monitoring.
- Kubernetes for container orchestration.
- Trivy for Docker image vulnerability scanning.
- Advanced deployment strategies.
- Improved automated rollback mechanisms.

## 10. Project Status

**Current Progress:** Phase 5 – Ansible Configuration Management.

**Completed Core Technologies:** Java, Spring Boot, Maven, Docker, Jenkins, GitHub, AWS ECR, Terraform, Ansible, AWS EC2, IAM, VPC, and Systems Manager.

**Upcoming Work:** CloudWatch Monitoring, Self-Healing Automation, SNS Notifications, and Final Testing.