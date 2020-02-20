docker build -t myjenk .
docker container run -d --name myjenkins --publish 8080:8080 myjenk:latest