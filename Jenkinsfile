node {
    def python = 'python:3.9-slim'

    try {
        docker.image(python).inside('-p 3000:3000 -u root') {
            stage('Install Dependencies') {
                sh 'pip install --no-cache-dir -r requirements.txt'
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
