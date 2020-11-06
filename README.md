# Welcome to the the cookingWeb app

## Prerequisites

* You need to have a [GitHub](https://github.com/) account and a [DockerHub](https://www.docker.com/) account

## Install dependencies on mac machine (to spin up Jenkins container in local machine)

* Install [Docker](https://docs.docker.com/docker-for-mac/install/)
* Install git in your machine: `brew install git`
* Download the repo from [here](https://github.com/diegofontecilla/cookingWeb) or...
  1. Open a terminal and move to a directory for storing the repo
  1. Run `git clone https://github.com/diegofontecilla/cookingWeb.git`
* On the terminal, move to the root directory of the repo and run `npm install`

## Install dependencies on Amazon Linux 2 EC2 instance (to spin up Jenkins container in AWS ec2 instance)

* Login your ec2 instance

* To install Docker run
  * `sudo amazon-linux-extras install docker -y`
  * `sudo service docker start`
  * `sudo usermod -a -G docker ec2-user` (find [here](https://sysadminxpert.com/solved-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/) related docs for this)
  * logout and login of the ec2 instance
  * general [documentation](https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9)

* To install git, run:
  * `sudo yum update -y`
  * `sudo yum install git -y`
  * `git version`
  * general [documentation](https://cloudaffaire.com/how-to-install-git-in-aws-ec2-instance/)

* To set up node.js run:
  * `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`
  * `. ~/.nvm/nvm.sh`
  * `nvm install node`
  * `node -e "console.log('Running Node.js ' + process.version)"`
  * general [documentation](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html)

## Build Jenkins image and deploy Jenkins in Docker container

* logged in on the ec2 instance, run `git clone https://github.com/diegofontecilla/cookingWeb.git`
* ls to root dir of repo: `cd cookingWeb/`
* build the image for Jenkins, run: `docker build -t myjenk .`
* run the container for Jenkins, run: `docker container run -d --name myjenkins -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock myjenk:latest`

## Configure the `cookingapp` Jenkins job manually (LOCAL MACHINE)

* Go to `http://localhost:8080/` and sign up in Jenkins
* On the jenkins UI, click on the `cookingapp` job and then on `configure`
* Under General, check the box `GitHub project` and paste the url of the git repo `https://github.com/diegofontecilla/cookingWeb`
* Under `Build Triggers`, check `GitHub hook trigger for GITScm polling` and save
* Configure DockerHub credentials for Jenkins
  * Go to the `cookingapp`, `Configure`, `Pipeline`, on `Definition` choose `Pipeline script` and click `Pipeline Syntax`
  * On `Sample Step` choose `withCredentials: Bind credentials to variables`
    * on `Bindings` click `add` and choose `Secret text`
      * set up variable => `dockerHubPwd`
      * click `add` and choose `Jenkins`
      * on `Kind` select `Secret text`
      * under `Secret` paste your DockerHub password
      * id: `docker-pass-id`
      * description: `Docker hub password`

## Configure the `cookingapp` Jenkins job manually (EC2 INSTANCE)

* From AWS console, copy the public IPv4 address of your instance and paste it in a new browser (add `:8080` at the end)
* Create a user
* On the jenkins UI, click on the `cookingapp` job and then on `configure`
* Under General, check the box `GitHub project` and paste the url of the git repo `https://github.com/diegofontecilla/cookingWeb`
* Under `Build Triggers`, check `GitHub hook trigger for GITScm polling` and save
* Configure DockerHub credentials for Jenkins
  * Go to the `cookingapp`, `Configure`, `Pipeline`, on `Definition` choose `Pipeline script` and click `Pipeline Syntax`
  * On `Sample Step` choose `withCredentials: Bind credentials to variables`
    * on `Bindings` click `add` and choose `Secret text`
      * set up variable => `dockerHubPwd`
      * click `add` and choose `Jenkins`
      * on `Kind` select `Secret text`
      * under `Secret` paste your DockerHub password
      * id: `docker-pass-id`
      * description: `Docker hub password`

## Configure `webhooks` on GitHub to build the `cookingapp` job after updates (push) on repo

* on the GitHub repo, go to settings, webhooks and add a new webhook.
[instructions](https://embeddedartistry.com/blog/2017/12/21/jenkins-kick-off-a-ci-build-with-github-push-notifications/)
* when running jenkins container on localhost, follow this:
  * sign up on `ngrok` and follow instructions: `https://dashboard.ngrok.com/get-started`
  * on GitHub repo under settings/Webhooks, don't forget to add `/github-webhook/` at the
  end of the URL given
* you nedd to run the first build manually. then, each commit to `master` will trigger the
cookingapp job

## Pipeline stages flow

![Stages flow](./diagrams/PipelineStageFlow.png)

## To build node image manually and deploy the cookingapp in local environment

* from app directory run:
  * `docker build -t fontecilla/cookingapp .`
  * `docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest`

## Run the app locally

* From `app` directory run `node app.js`
* On browser go to `http://localhost:3000/`

## TODO

* [ ] update diagram
* [ ] automate deployment of ec2 instance with ClodFormation. then move it to terraform
* [ ] automated installation of software required in ec2 instance (docker, git, node)
* [ ] automate creation of user for Jenkins with casc
* [ ] automate provision of DockerHub credentials for Jenkins
* [ ] run tests in an agent: 
  * the Jenkins server (ec2 instance) respond on a specif port
  * check that the website respond, front end test
* [ ] create agent for running `cookingapp` job
* [ ] in diagram, express that containers run in local machine, and docker, git and jfrog outside of it
* [ ] run tests in agent (thecookingwebapp container). I need to setup the agent. see [this](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops) and [this](https://devopscube.com/docker-containers-as-build-slaves-jenkins/)
* [ ] think in the design: how the new features are integrated in the cookingwebapp container
* [ ] give Jenkins permissions to run docker commands
* [ ] take out cypress (completely)
* [ ] deploy cookingwebapp to an ec2 instance using ssh agent plugin. [see this](https://www.youtube.com/watch?v=gdbA3vR2eDs) at minute 28
* [ ] update configuration-as-code:1.35 to latest
* [ ] modify diagram. the app container is outside Jenkins container. [read reference](https://medium.com/@manav503/how-to-build-docker-images-inside-a-jenkins-container-d59944102f30)
* [ ] update Docker version (docker installed inside Jenkins container) on Jenkins image
* [ ] on jenkins/plugins.txt, pin the nodejs plugin
* [ ] in the last step of the pipeline, save a artifact and store it in an artifact repo
* [ ] deploy Jenkins container using Fargate. see this:
  - [Deploy Docker Containers](https://aws.amazon.com/getting-started/hands-on/deploy-docker-containers/)
  - [Deploying on AWS Fargate using Cloudformation](https://medium.com/@anupam.ncsu/deploying-on-aws-fargate-using-cloudformation-3bf33cefbf18)
