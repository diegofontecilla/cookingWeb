# Welcome to the the cookingWeb app

## Install dependencies

* Open a terminal and from root directory run `npm install`

## Run the app locally

* From `app` directory run `node app.js`
* On browser go to `http://localhost:3000/`

## To build jenkins image and deploy jenkins in docker container

* from root directory run:
  * `docker build -t myjenk .`
  * `docker container run -d --name myjenkins --publish 8080:8080 myjenk:latest`

## To build node image manually and deploy the cookingapp in local environment

* from directory run:
  * `docker build -t fontecilla/cookingapp .`
  * `docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest`

## Configure the `cookingapp` job manually

* on the jenkins UI, click on the `cookingapp` job and then on `configure`
* check the box `GitHub project` and paste the url of the git repo
* under `Build Triggers`, check `GitHub hook trigger for GITScm polling` and save

## Configure `webhooks` on git to build the `cookingapp` job after updates (push) on repo

* on the git repo, go to settings, webhooks and add a new webhook
* if running jenkins container on localhost, follow this instructions:
`https://embeddedartistry.com/blog/2017/12/21/jenkins-kick-off-a-ci-build-with-github-push-notifications/`
  * sign up on `ngrok` and follow instructions: `https://dashboard.ngrok.com/get-started`
* you nedd to run the first build manually

## Pipeline stages flow

![Stages flow](./diagrams/PipelineStageFlow.png)

## TODO

* [x] on jenkins/plugins.txt, pin the nodejs plugin
* [x] i need to start the cookingapp inside the container in order to test is (`npm start`). i need to find a way of doing this. i did it on the container itself masnually and it works. i tryed doing it in the Dockerfile but it does not work.
* [x] in the last step of the pipeline, save a artifact and store it in an artifact repo
