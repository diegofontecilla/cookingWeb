# Welcome to the the cookingWeb app

## Install dependencies

* Download the repo from [here](https://github.com/diegofontecilla/cookingWeb)
* Open a terminal and from root directory of the repo run `npm install`

## Run the app locally

* From `app` directory run `node app.js`
* On browser go to `http://localhost:3000/`

## Build Jenkins image and deploy Jenkins in Docker container

* from root directory run:
  * `docker build -t myjenk .`
  * `docker container run -d --name myjenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock myjenk:latest`

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
* if running jenkins container on localhost, follow this [instructions](https://embeddedartistry.com/blog/2017/12/21/jenkins-kick-off-a-ci-build-with-github-push-notifications/)
  * sign up on `ngrok` and follow instructions: `https://dashboard.ngrok.com/get-started`
* you nedd to run the first build manually

## Pipeline stages flow

![Stages flow](./diagrams/PipelineStageFlow.png)

## TODO

* [ ] run tests in agent (thecookingwebapp container)
* [ ] think in the design: how the new features are integrated in the cookingwebapp container
* [ ] give Jenkins permissions to run docker commands
* [ ] take out cypress (completely)
* [ ] deploy cookingwebapp to an ec2 instance using ssh agent plugin. [see this](https://www.youtube.com/watch?v=gdbA3vR2eDs) at minute 28
* [ ] update configuration-as-code:1.35 to latest
* [ ] modify diagram. the app container is outside Jenkins container. [read reference](https://medium.com/@manav503/how-to-build-docker-images-inside-a-jenkins-container-d59944102f30)
* [ ] update Docker version (docker installed inside Jenkins container) on Jenkins image
* [ ] on jenkins/plugins.txt, pin the nodejs plugin
* [ ] in the last step of the pipeline, save a artifact and store it in an artifact repo
