pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Meedee22/Maintenance.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("meedee22/node-app:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                    docker stop node-app-container || true
                    docker rm node-app-container || true
                    docker run -d -p 3000:3000 --name node-app-container meedee22/node-app:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
