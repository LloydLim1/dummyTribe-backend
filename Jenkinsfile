pipeline {
    agent any
    
    tools {
        nodejs 'node-18' 
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/LloydLim1/dummyTribe-backend.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                bat 'npm test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'
                    withSonarQubeEnv('sonar-server') {
                        bat "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=backend-repo -Dsonar.sources=."
                    }
                }
            }
        }
        
        // --- NEW: The Delivery Stage ---
        stage('Build & Push to Docker Hub') {
            steps {
                script {
                    // This logs Jenkins in using the ID you just created
                    docker.withRegistry('', 'docker-hub-credentials') {
                        
                        // 1. Build the image with your Docker Hub Username
                        // Format: <username>/<repo-name>:latest
                        bat 'docker build -t lloydlim10/dummy-backend:latest .'
                        
                        // 2. Push it to the cloud
                        bat 'docker push lloydlim10/dummy-backend:latest'
                    }
                }
            }
        }
    }
}