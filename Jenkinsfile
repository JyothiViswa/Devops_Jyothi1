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
                git branch: 'develop', url: 'https://github.com/JyothiViswa/Devops_Jyothi1.git'
                
                echo "Building Docker image from Dockerfile..."
                sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
            }
        }

        stage('Job2 : test') {
            steps {
        sh '''
            echo "Starting container for testing..."
            docker run -d --name temp-webapp-test -p 8080:80 webapp-app:${BUILD_NUMBER}
            
            # Give Apache a couple of seconds to initialize
            sleep 3
            
            # Run curl test to verify the server is responding
            curl -f http://localhost:8080 || exit 1
            
            # Clean up the test container
            docker stop temp-webapp-test
            docker rm temp-webapp-test
        '''
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
