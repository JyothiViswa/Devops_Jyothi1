pipeline {
    agent { label '100.56.157.104_LinuxAgent1' }

    environment {
        IMAGE_NAME = "webapp-app"
        DOCKER_REGISTRY_CREDENTIALS = "jyothihelios"
    }

    stages {
        stage('Job1 : build') {
            steps {
                echo "Pulling code from GitHub repository..."
                // Explicitly clones your repository and branch
                git branch: 'master', url: 'https://github.com/JyothiViswa/Devops_Jyothi1.git'
                
                echo "Building Docker image from Dockerfile..."
                sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
            }
        }

        stage('Job2 : test') {
            steps {
                echo "Running test suite on the containerized product..."
                sh "docker run --rm ${IMAGE_NAME}:${env.BUILD_NUMBER}"
            }
        }
    }
    post {
        always {
            echo "Cleaning up local build images..."
            sh "docker rmi ${IMAGE_NAME}:${env.BUILD_NUMBER} || true"
        }
    }   
}
