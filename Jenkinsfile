pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/anushree1212/nodejs.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-nodejs-app:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                        docker run --hostname=b0bd24c6ba1a \
                                   --mac-address=02:42:ac:11:00:02 \
                                   --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
                                   --env=NODE_VERSION=14.21.3 \
                                   --env=YARN_VERSION=1.22.19 \
                                   --network=bridge \
                                   --workdir=/usr/src/app \
                                   --restart=no \
                                   --runtime=runc \
                                   -d my-nodejs-app:latest
                    '''
                }
            }
        }
    }
}
