pipeline {
    agent any
    
    tools {
        // This must match the name you gave in 'Global Tool Configuration'
        nodejs 'node-18' 
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Gets your code from GitHub
                git branch: 'main', url: 'https://github.com/LloydLim1/dummyTribe-backend.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // We use 'bat' because your Jenkins is on Windows
                bat 'npm install' 
            }
        }

        // --- NEW STAGE: The Inspector ---
        stage('SonarQube Analysis') {
            steps {
                script {
                    // 1. Get the scanner tool (must match the name in Jenkins Global Tools)
                    def scannerHome = tool 'sonar-scanner'
                    
                    // 2. Connect to the server (must match the name in Jenkins System)
                    withSonarQubeEnv('sonar-server') {
                        // 3. Run the scan command
                        bat "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=backend-repo -Dsonar.sources=."
                    }
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                echo 'Running Unit Tests...'
                // If this fails, the pipeline STOPS here.
                bat 'npm test'
            }
        }

        stage('Build Docker Image'){
            steps {
                echo 'Building Docker Image...'
                bat 'docker build -t dummy-backend .'
            }
        }
    }
}