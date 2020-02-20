# Welcome to the the cookingWeb app

## Install dependencies

* From root directory, run `npm install`

## To run the app

* Open a terminal and go to the root directory of the project and run: `node app.js`

## To build jenkins image and deploy jenkins in docker container

* run:
  * `docker build -t myjenk .`
  * `docker container run -d --name myjenkins --publish 8080:8080 myjenk:latest`

## Configure the `cookingapp` job manually

* on the jenkins UI, click on the `cookingapp` job
* apparently, nothing to do here

## TODO

* [x] on jenkins/plugins.txt, pin the nodejs plugin
