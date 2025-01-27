node {
    stage('Install Dependencies') {
        docker.image('python:3.9-slim').inside {
            sh 'ls -la requirements.txt'
            sh 'pipe install -U -r requirements.txt --verbose'
        }
    }

    stage('Build') {
        docker.image('python:3.9-slim').inside {
            sh 'pylint --fail-under=8 **/*.py'
        }
    }

    stage('Test') {
        docker.image('qnib/pytest').inside {
            sh 'py.test --junit-xml --junit-xml=unittests.xml **/test_*.py --cov-report=xml --cov=gameactions --cov-branch'
        }
        junit 'unittests.xml '
    }
}
