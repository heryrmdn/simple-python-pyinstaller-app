node {
    stage('Build') {
        sh 'pylint --fail-under=8 *.py'
    }
    stage('Test') {
        sh 'pytest test_*.py --junit-xml=unittests.xml --cov-report=xml --cov=gameactions --cov-branch'
    }
}
