# Self-Healing Cloud Infrastructure & Automated Deployment Platform

## 1. Project Overview

The Self-Healing Cloud Infrastructure & Automated Deployment Platform is a DevOps project designed to automate application deployment, cloud infrastructure provisioning, monitoring, failure detection, and application recovery using AWS and DevOps tools.

The main objective is to build a fully automated deployment platform where developers can push application code to GitHub and the CI/CD pipeline handles the remaining deployment activities.

The platform will also detect application failures and attempt automatic recovery.

## 2. Project Objectives

- Automate application build and deployment.
- Provision AWS infrastructure using Terraform.
- Configure servers using Ansible.
- Containerize applications using Docker.
- Implement CI/CD using Jenkins.
- Store Docker images in AWS ECR.
- Monitor application health and logs.
- Implement automatic application recovery.
- Implement automatic rollback for failed deployments.
- Send notifications for deployment failures and recovery events.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Java 21 | Application development |
| Spring Boot | REST API development |
| Maven | Build automation and dependency management |
| Git | Version control |
| GitHub | Source code management |
| Docker | Application containerization |
| Jenkins | CI/CD automation |
| AWS EC2 | Application hosting |
| AWS VPC | Network infrastructure |
| AWS IAM | Access management |
| AWS ECR | Docker image repository |
| AWS S3 | Terraform state storage |
| Terraform | Infrastructure as Code |
| Ansible | Configuration management |
| AWS CloudWatch | Monitoring and logging |
| AWS SNS | Notifications |

## 4. Project Architecture

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
Docker Image Creation
    |
    v
AWS ECR
    |
    v
AWS EC2
    |
    v
CloudWatch Monitoring
    |
    v
Self-Healing and Automatic Rollback

## 5. Project Implementation

### Phase 1: Java Application Development

**Objective:** Develop a Spring Boot application with health-check and version endpoints.

Technologies:
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

    mvn clean compile

Run unit tests:

    mvn test

Package the application:

    mvn clean package

Run the application:

    mvn spring-boot:run

#### Application Configuration

    Application Name: self-healing-app
    Server Port: 8080
    Java Version: 21

#### Expected Health Response

    {
      "status": "UP",
      "application": "self-healing-app"
    }

### Phase 2: Docker Containerization

Coming soon.

### Phase 3: AWS Infrastructure Using Terraform

Coming soon.

### Phase 4: Ansible Configuration Management

Coming soon.

### Phase 5: Jenkins CI/CD Pipeline

Coming soon.

### Phase 6: AWS ECR Integration

Coming soon.

### Phase 7: Automated Application Deployment

Coming soon.

### Phase 8: Monitoring and Logging

Coming soon.

### Phase 9: Self-Healing and Automatic Rollback

Coming soon.

### Phase 10: Final Testing and Documentation

Coming soon.

## 6. Self-Healing Features

The platform will implement the following features:

- Application health monitoring.
- Automatic container restart.
- Failure detection.
- Automatic deployment rollback.
- Application recovery.
- Deployment notifications.

## 7. Project Progress

- [x] Phase 1: Java Application Development
- [ ] Phase 2: Docker Containerization
- [ ] Phase 3: AWS Infrastructure Using Terraform
- [ ] Phase 4: Ansible Configuration Management
- [ ] Phase 5: Jenkins CI/CD Pipeline
- [ ] Phase 6: AWS ECR Integration
- [ ] Phase 7: Automated Deployment
- [ ] Phase 8: Monitoring and Logging
- [ ] Phase 9: Self-Healing and Rollback
- [ ] Phase 10: Final Testing and Documentation

## 8. Project Goal

To build an end-to-end automated DevOps platform on AWS that minimizes manual deployment activities, improves application availability, and provides automated failure recovery.

**Project Status:** Phase 1 Completed – Java Application Development.