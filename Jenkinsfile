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
        
        stage('Test') {
            steps {
                echo 'Running Unit Tests...'
                // sh 'npm test' (We will activate this later)
            }
        }
    }
}