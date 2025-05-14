# “CI/CD Pipeline with Security Scanning & Monitoring for a Node.js App on AWS”

This project demonstrates a complete CI/CD pipeline using Jenkins to build, test, scan, and deploy a Node.js application into an EKS cluster via Helm charts.

## 🔧 Tools Used

- Jenkins
- Docker
- Kubernetes (EKS)
- Amazon ECR
- Helm
- Trivy (Security Scanning)
- SonarQube
- Prometheus + Grafana
- Slack (Optional notifications)

## 📦 Pipeline Stages
 Github 
    |-- webhook 

    
Jenkins pipeline
    ├── SonarQube Static Code Analysis
    ├── npm Build
    ├── Trivy Image Scan
    ├── Docker Build & Push to ECR
    └── Deploy to EKS using Helm

    
Kubernetes Cluster
    ├── Node.js App Pod
    ├── Prometheus Scraper
    ├── Grafana Dashboard
    └── Slack Alerts via AlertManager

## 🔍 Pre-reqs

- DockerHub credentials (Jenkins secret: `dockerhub-creds`)
- EKS cluster with `kubectl` + `helm` access from Jenkins
- Trivy installed on Jenkins node
