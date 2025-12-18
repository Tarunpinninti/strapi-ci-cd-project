## 🚀 Strapi CI/CD Deployment on AWS EC2 using Terraform & GitHub Actions

This project demonstrates a complete CI/CD pipeline to build, push, and deploy a Strapi CMS application on AWS EC2 using Docker, Terraform, and GitHub Actions.

The goal of this project is to automate:

    Docker image build & push

    Infrastructure provisioning

    Application deployment on EC2

## 🧱 Architecture Overview

    GitHub (Code Push)
        |
        v
    GitHub Actions (CI)
    - Build Docker Image
    - Push to Docker Hub
        |
        v
    GitHub Actions (CD - Manual)
    - Terraform Init
    - Terraform Apply
        |
        v
    AWS EC2
    - Docker installed
    - Strapi container running on port 1337

## 🛠️ Tech Stack

- Strapi – Headless CMS

- Docker – Containerization

- Docker Hub – Image Registry

- Terraform – Infrastructure as Code

- GitHub Actions – CI/CD

- AWS EC2 – Application hosting

- Amazon Linux 2023

## 📁 Project Structure

    strapi-ci-cd-project/
    ├── .github/workflows/
    │   ├── ci.yml           # Build & Push Docker Image
    │   └── terraform.yml    # Deploy Strapi to EC2
    │
    ├── terraform/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── providers.tf
    │
    ├── Dockerfile
    ├── .dockerignore
    ├── .env.example
    ├── package.json
    └── README.md

## 🔄 CI Pipeline (Build & Push)

Trigger:
Runs automatically on push to main branch.

Steps:

    Checkout code

    Login to Docker Hub

    Build Strapi Docker image

    Push image to Docker Hub

## 🚀 CD Pipeline (Deploy to EC2)
Trigger:
Manual (workflow_dispatch)

Steps:

    Configure AWS credentials

    Initialize Terraform

    Apply Terraform configuration

    Launch EC2 instance

    Install Docker via user-data

    Pull Strapi Docker image

    Run Strapi container on port 1337

## ⚙️ Terraform Resources

- EC2 Instance (t2.micro)

- Existing Security Group (ports 22 & 1337)

- Docker installed via user_data

- Outputs public Strapi URL

## 🔐 GitHub Secrets Required

Add these in GitHub → Settings → Secrets → Actions

  Docker Hub:
  
                DOCKERHUB_USERNAME
                DOCKERHUB_TOKEN
  AWS:
  
                AWS_ACCESS_KEY_ID
                AWS_SECRET_ACCESS_KEY
                AWS_REGION

## 🌍 Accessing Strapi

After successful deployment, Terraform outputs:

      http://54.82.164.238:1337/admin

## 🐳 Running Strapi Container (on EC2)

    docker run -d \
    --name strapi \
    --env-file /home/ec2-user/.env \
    -p 1337:1337 \
    tarunpinninti369/strapi:latest

## 🧪 Verification Steps

    docker ps
    docker logs strapi


