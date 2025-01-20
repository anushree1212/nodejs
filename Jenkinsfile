pipeline {
    agent any
    stages {
        stage('Checkout and Commit') {
            steps {
                script {
                    // Pull the latest changes from GitHub
                    bat 'git pull origin main'

                    // Add any changes to the staging area
                    bat 'git add .'

                    // Commit changes with a message
                    bat 'git commit -m "Automated commit by Jenkins" || echo "No changes to commit"'

                    // Push the changes to GitHub
                    bat 'git push '
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
                    // Stop and remove any existing container with the same name (Windows-compatible)
                    bat '''
                    docker ps -a -q -f name=nodejs | ForEach-Object { docker stop $_; docker rm $_ }
                    '''

                    // Run the Docker container from the built image
                    bat 'docker run -d -p 5000:5000 --name nodejs my-nodejs-app'
                    
                    // Check if the container is running
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
