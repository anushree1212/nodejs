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

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 my-nodejs-app'
                    sh 'docker ps'  // To verify the container is running
                }
            }
        }
    }
}
