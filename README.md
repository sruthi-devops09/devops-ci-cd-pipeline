# devops-ci-cd-pipeline
CI/CD Pipeline using Jenkins + Docker + Kubernetes (AKS).


Actions performed:
-----------------------------------------
Pull code from GitHub

Run unit tests (npm test)

Run Trivy scan on the Docker image

Build Docker image

Push to DockerHub

Deploy to AKS using Helm

Notify on Slack/MS Teams (optional)
