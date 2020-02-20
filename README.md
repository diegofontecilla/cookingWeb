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

* on the jenkins UI, click on the `cookingapp` job and then on `configure`
* check the box `GitHub project` and paste the url of the git repo
* under `Build Triggers`, check `GitHub hook trigger for GITScm polling` and save

## Configure `webhooks` on git to build the `cookingapp` job after updates (push) on repo

* on the git repo, go to settings, webhooks and add a new webhook
* if running jenkins container on localhost, follow this instructions:
`https://embeddedartistry.com/blog/2017/12/21/jenkins-kick-off-a-ci-build-with-github-push-notifications/`
  * sign up on `ngrok` and follow instructions: `https://dashboard.ngrok.com/get-started`

## TODO

* [x] on jenkins/plugins.txt, pin the nodejs plugin
