pipeline {
    agent {
        docker {
            image 'python:3.9-slim'
            args '-p 3000:3000'
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt --no-cache-dir'
            }
        }
        stage('Build') {
            steps {
                sh 'pylint --fail-under=8 *.py'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest test_*.py --junit-xml=unittests.xml --cov-report=xml --cov=gameactions --cov-branch'
            }
        }
    }
}
