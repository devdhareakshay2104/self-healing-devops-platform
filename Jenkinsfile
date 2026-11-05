
stage('Push to ECR') {
    steps {
        script {
            def registry = '273804046923.dkr.ecr.us-east-1.amazonaws.com'
            def repository = 'self-healing-app'
            def imageTag = "build-${env.BUILD_NUMBER}"

            sh """
                echo "Authenticating Docker with Amazon ECR..."

                aws ecr get-login-password --region us-east-1 | \
                docker login --username AWS --password-stdin ${registry}

                echo "Tagging Docker image..."

                docker tag self-healing-app:v4 ${registry}/${repository}:${imageTag}

                docker tag self-healing-app:v4 ${registry}/${repository}:latest

                echo "Pushing Docker image to ECR..."

                docker push ${registry}/${repository}:${imageTag}

                docker push ${registry}/${repository}:latest

                echo "Docker images pushed successfully!"
            """
        }
    }
}
