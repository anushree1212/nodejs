pipeline {
    agent any
    environment {
        GIT_REPO = 'https://github.com/anushree1212/nodejs.git'  // Your repo URL
        GIT_BRANCH = 'main'  // Your branch
    }
    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Pull the latest changes from the repo
                    bat 'cd C:\\Users\\anush\\my-nodejs-app && git pull origin main'
                }
            }
        }

        stage('Commit and Push Changes') {
            steps {
                script {
                    // Add changes to Git
                    bat 'cd C:\\Users\\anush\\my-nodejs-app && git add .'
                    
                    // Commit changes to Git with a message
                    bat '''cd C:\\Users\\anush\\my-nodejs-app && git commit -m "Automated commit by Jenkins" || echo "No changes to commit"'''
                    
                    // Push changes to GitHub (Make sure Jenkins has the credentials configured)
                    bat 'cd C:\\Users\\anush\\my-nodejs-app && git push origin main'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image for the Node.js app
                    bat 'cd C:\\Users\\anush\\my-nodejs-app && docker build -t my-nodejs-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container with the built image
                    bat 'docker run -d -p 5000:5000 --name nodejs my-nodejs-app'
                    
                    // Check the running Docker container
                    bat 'docker ps'
                }
            }
        }

        stage('Stop and Remove Docker Container') {
            steps {
                script {
                    // Stop and remove any existing Docker container
                    bat 'docker stop nodejs || true'
                    bat 'docker rm nodejs || true'
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
