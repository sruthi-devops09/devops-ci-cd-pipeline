pipeline {
  agent any

  environment {
    ECR_REPO = 'your-aws-account-id.dkr.ecr.region.amazonaws.com/nodejs-app'
    IMAGE_TAG = "nodejs-app-${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/your-username/nodejs-cicd-secure-pipeline.git'
      }
    }

    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('MySonarQube') {
          sh 'sonar-scanner -Dsonar.projectKey=nodejs-app -Dsonar.sources=app -Dsonar.host.url=http://your-sonarqube-url -Dsonar.login=your-sonarqube-token'
        }
      }
    }

    stage('Build') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Docker Build & Trivy Scan') {
      steps {
        sh '''
          docker build -t $ECR_REPO:$IMAGE_TAG .
          trivy image --exit-code 0 --severity MEDIUM,HIGH $ECR_REPO:$IMAGE_TAG
        '''
      }
    }

    stage('Push to ECR') {
      steps {
        sh '''
          aws ecr get-login-password --region region | docker login --username AWS --password-stdin $ECR_REPO
          docker push $ECR_REPO:$IMAGE_TAG
        '''
      }
    }

    stage('Deploy to EKS') {
      steps {
        sh 'helm upgrade --install nodejs-app ./helm --set image.repository=$ECR_REPO,image.tag=$IMAGE_TAG'
      }
    }
  }
}
