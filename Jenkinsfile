pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/anushree1212/nodejs.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-nodejs-app .'
                    sh 'docker images'  // To verify the image is built
                }
            }
        }

        stage('Stop Existing Container') {
            steps {
                script {
                    sh 'docker stop my-nodejs-app || true'
                    sh 'docker rm my-nodejs-app || true'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 --name my-nodejs-app my-nodejs-app'
                    sh 'docker ps'  // To verify the container is running
                    sh 'docker logs my-nodejs-app'  // To check logs of the running container
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean the workspace after the build
        }
    }
}
