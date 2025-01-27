node {
    def python = 'python:3.9-slim'

    stage('Install Dependencies') {
	docker.image(python).inside {
            sh 'pwd'
            sh 'ls -la'
            sh 'pip3 install -r requirements.txt --no-cache-dir'
        }
    }
    stage('Build') {
        docker.image(python).inside {
            sh 'pylint --fail-under=8 *.py'
        }
    }
    stage('Test') {
        docker.image(python).inside {
            sh 'pytest test_*.py --junit-xml=unittests.xml --cov-report=xml --cov=gameactions --cov-branch'
        }
    }
}
