pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Mark the directory as safe to fix "dubious ownership" issue
                    bat 'git config --global --add safe.directory C:/Users/anush/my-nodejs-app'
                    
                    // Change to the project directory and pull the latest code
                    bat '''
                    cd C:\\Users\\anush\\my-nodejs-app
                    git pull origin main
                    git add .
                    git commit -m "Commit the updated changes"
                    git push 
                    '''
                }
            }
        }

        stage('Stop Existing Docker Container') {
            steps {
                script {
                    // Stop and remove the existing container if it exists
                    bat '''
                    docker stop my-nodejs-app || true
                    docker rm my-nodejs-app || true
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat '''
                    cd C:\\Users\\anush\\my-nodejs-app
                    docker build -t my-nodejs-app .
                    '''
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    bat '''
                    docker run -d -p 5000:5000 --name node my-nodejs-app
                    docker ps
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after the build
        }
    }
}
