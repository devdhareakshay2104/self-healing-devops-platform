
pipeline {
    agent any

    environment {
        APP_DIR = 'application/self-healing-app'
        IMAGE_NAME = 'self-healing-app'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub'
                checkout scm
            }
        }

        stage('Build and Test') {
            steps {
                dir("${APP_DIR}") {
                    sh 'chmod +x mvnw'
                    sh './mvnw clean verify'
                }
            }
        }

        stage('Docker Build') {
            steps {
                dir("${APP_DIR}") {
                    sh 'docker build -t self-healing-app:latest .'
                }
            }
        }

        stage('Deploy') {
            steps {
                dir("${APP_DIR}") {
                    sh 'docker compose up -d --build'
                }
            }
        }

        stage('Health Check') {
            steps {
                sh '''
                    for i in $(seq 1 12); do
                        STATUS=$(docker inspect \
                          --format='{{.State.Health.Status}}' \
                          self-healing-compose 2>/dev/null || true)

                        if [ "$STATUS" = "healthy" ]; then
                            echo "Application is healthy!"
                            exit 0
                        fi

                        echo "Waiting for application health..."
                        sleep 10
                    done

                    echo "Application health check failed!"
                    docker compose -f application/self-healing-app/compose.yaml logs
                    exit 1
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed. Check the console output.'
        }
    }
}
