node {
    stage('Build') {
        docker.image('python:3.9-slim').inside {
            sh 'python -m py_compile **/*.py'
        }
    }

    stage('Test') {
        docker.image('qnib/pytest').inside {
            sh 'py.test --verbose --junit-xml test-reports/results.xml **/test_*.py'
        }
        junit 'test-reports/results.xml'
    }
}
