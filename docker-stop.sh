docker stop jenkins-docker
docker stop jenkins-blueocean
docker stop prometheus
docker stop grafana
docker rm jenkins-docker
docker rm jenkins-blueocean
docker rm prometheus
docker rm grafana
docker network rm jenkins
