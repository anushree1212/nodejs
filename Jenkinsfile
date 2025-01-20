pipeline {
    agent any
    stages {
        stage('Checkout and Commit') {
            steps {
                script {
                    // Change to the project directory and pull latest changes
                    bat 'cd C:\\Users\\anush\\my-nodejs-app && git pull origin main'

                    // Add any changes to the staging area
                    bat 'git add .'

                    // Commit changes with a message, handle if no changes
                    bat 'git commit -m "Commit the updated changes" || echo "No changes to commit"'

                    // Push the changes to GitHub using Jenkins credentials
                    bat 'git push'
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
                    bat 'docker run -d -p 5000:5000 --name nodejs my-nodejs-app'

                    // Check the running Docker container
                    bat 'docker ps'
                }
            }
        }

        stage('Stop and Remove Docker Container') {
            steps {
                script {
                    // Stop the existing Docker container if it exists
                    bat 'docker stop nodejs || true'

                    // Remove the existing Docker container
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
