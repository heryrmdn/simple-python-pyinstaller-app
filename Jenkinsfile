node {
    docker.image('python:3.9-slim').inside('--user root') {
        stage('Install Dependencies') {
            sh 'pip3 install -U -r requirements.txt --verbose'
        }
        stage('Build') {
            sh 'pylint --fail-under=8 **/*.py'
        }
        stage('Test') {
            sh 'py.test --junit-xml --junit-xml=unittests.xml **/test_*.py --cov-report=xml --cov=gameactions --cov-branch'
            junit 'unittests.xml '
        }
    }
}
