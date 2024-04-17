pipeline {
    agent any

    environment {
        // Define Docker image tag and repository
        DOCKER_IMAGE = 'yourdockerhubusername/simple-reactjs-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clones the GitHub repository
                git 'https://github.com/aditya-sridhar/simple-reactjs-app'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Running dependency installation for a Node.js project
                script {
                    docker.image('node:14-alpine').inside {
                        sh 'npm install'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Building the Docker image
                    docker.build("$DOCKER_IMAGE")
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    // Running the Docker image to ensure it's working
                    docker.image("$DOCKER_IMAGE").run()
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Logging into Docker Hub and pushing the image
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerHubCredentials') {
                        docker.image("$DOCKER_IMAGE").push()
                    }
                }
            }
        }
    }

    post {
        success {
            // Actions to perform after successful execution
            echo 'Pipeline executed successfully!'
        }
        failure {
            // Actions to perform if the pipeline fails
            echo 'Pipeline failed!'
        }
    }
}
