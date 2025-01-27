node {
    def python = 'python:3.9-slim'

    try {
        docker.image(python).inside {
            stage('Install Dependencies') {
                sh 'pip install --no-chace-dir --user -r requirements.txt'
            }

            stage('Build') {
                sh 'pylint --fail-under=8 *.py'
            }

            stage('Test') {
                sh 'pytest test_*.py --junit-xml=unittests.xml --cov-report=xml --cov=gameactions --cov-branch'
            }
        }

    } catch (Exception e) {
        currentBuild.result = 'FAILURE'
        throw e
    }
}
