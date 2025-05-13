pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sruthikarri/nodejs-app:${BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/sruthi-devops09/devops-ci-cd-pipeline.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }

        stage('Unit Tests') {
            steps {
                dir('app') {
                    sh 'npm test'
                }
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy fs .'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to AKS') {
            steps {
                sh """
                helm upgrade --install nodejs-app helm/nodejs-app \
                    --namespace dev \
                    --create-namespace \
                    --set image.repository=sruthikarri/nodejs-app \
                    --set image.tag=${BUILD_NUMBER}
                """
            }
        }
    }
}
