pipeline {
    agent any
    stages {
        stage('Checkout and Commit') {
            steps {
                script {
                    // Change to the project directory
                    bat 'cd C:\\Users\\anush\\my-nodejs-app'

                    // Pull the latest changes from GitHub
                    bat 'git pull origin main'

                    // Add any changes to the staging area
                    bat 'git add .'

                    // Commit changes with a message
                    bat 'git commit -m "Automated commit by Jenkins" || echo "No changes to commit"'

                    // Push the changes to GitHub
                    bat 'git push origin main'
                }
            }
        }

        stage('Stop and Remove Docker Container') {
            steps {
                script {
                    // Stop the existing Docker container if it exists
                    bat 'docker stop my-nodejs-app || true'

                    // Remove the existing Docker container
                    bat 'docker rm my-nodejs-app || true'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install the npm dependencies
                    bat 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image for the Node.js app
                    bat 'docker build -t my-nodejs-app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container with the built image
                    bat 'docker run -d -p 5000:5000 --name my-nodejs-app my-nodejs-app'
                    
                    // Check the running Docker container
                    bat 'docker ps'
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
