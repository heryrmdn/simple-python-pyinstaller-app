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
                sh 'python3 -m venv /tmp/venv && source /tmp/venv/bin/activate && pip3 install --user -r requirements.txt --no-cache-dir'
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
