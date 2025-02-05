node {
    docker.image('python:3.9-slim').inside('--user root') {
        stage('Install Dependencies') {
            sh 'python3 -m pip install --no-cache-dir -U -r requirements.txt --verbose'
            sh 'python3 -m pip install pyinstaller'
	    sh 'apt-get update && apt-get install -y binutils build-essential libssl-dev libffi-dev'
        }
        stage('Build') {
            sh 'pylint --fail-under=8 **/*.py'
        }
        stage('Test') {
            sh 'pytest **/test_*.py --junit-xml=unittests.xml'            
            junit 'unittests.xml'
        }
	stage('Manual Approval') {
            input(message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk melanjutkan)')
        }
	stage('Deploy') {
            sh 'pyinstaller --onefile sources/add2vals.py'
            archiveArtifacts 'dist/add2vals'
            sh 'sleep 5m'
        }
    }
}
