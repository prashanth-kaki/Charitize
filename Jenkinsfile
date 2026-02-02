pipeline {
    agent any

    environment {
        IMAGE_NAME = "charity-static-site"
        CONTAINER_NAME = "charity-site"
        HOST_PORT = "8082"
        CONTAINER_PORT = "8080"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                    if [ $(docker ps -aq -f name=$CONTAINER_NAME | wc -l) -gt 0 ]; then
                      docker rm -f $CONTAINER_NAME
                    fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                    docker run -d \
                      -p $HOST_PORT:$CONTAINER_PORT \
                      --name $CONTAINER_NAME \
                      $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "Deployment successful: http://<server-public-ip>:8082"
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}
