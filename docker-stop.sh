docker stop jenkins-docker
docker stop jenkins-blueocean
docker stop prometheus
docker stop grafana
: 'docker rm jenkins-docker'
: 'docker rm jenkins-blueocean'
: 'docker network rm jenkins'
