node {
    docker.image('python:3.9-slim').inside('--user root') {
        stage('Install Dependencies') {
            sh 'pip3 install -U -r requirements.txt --verbose'
        }
        stage('Build') {
            sh 'pylint --fail-under=8 **/*.py'
        }
        stage('Test') {
            sh 'pytest **/test_*.py --junit-xml=unittests.xml'            
            junit 'unittests.xml'
        }
	stage('Deploy') {
            sh 'pyinstaller --onefile sources/add2vals.py'
            archiveArtifacts 'dist/add2vals'
        }
    }
}
