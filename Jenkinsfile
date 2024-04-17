pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub repository...'
                git 'https://github.com/umerfaro/lab11-12.git'
            }
        }

        stage('Dependency Installation') {
            steps {
                echo 'Installing dependencies for the project...'
                bat 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t my-reactjs-app:latest .'
            }
        }

        stage('Run Docker Image') {
            steps {
                echo 'Running Docker image...'
                bat 'docker run -d -p 3000:3000 my-reactjs-app:latest'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([string(credentialsId: 'papa1122@', variable: 'papa1122@')]) {
                    bat 'docker login -u umer12314sr -p $papa1122@'
                    bat 'docker tag my-reactjs-app:latest umer12314sr/my-reactjs-app:latest'
                    bat 'docker push umer12314sr/my-reactjs-app:latest'
                }
            }
        }
    }
}