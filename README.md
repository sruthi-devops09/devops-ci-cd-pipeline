# DevOps CI/CD Pipeline: Jenkins + Docker + Kubernetes (AKS)

This project demonstrates a complete CI/CD pipeline using Jenkins to build, test, scan, and deploy a Node.js application into an AKS cluster via Helm charts.

## 🔧 Tools Used

- Jenkins
- Docker
- Kubernetes (AKS)
- Helm
- Trivy (Security Scanning)
- Slack (Optional notifications)

## 📦 Pipeline Stages

1. Checkout Code
2. Run Tests (Mocha)
3. Docker Build
4. Trivy Security Scan
5. Push to DockerHub
6. Deploy to AKS via Helm

## 🔍 Pre-reqs

- DockerHub credentials (Jenkins secret: `dockerhub-creds`)
- AKS cluster with `kubectl` + `helm` access from Jenkins
- Trivy installed on Jenkins node
