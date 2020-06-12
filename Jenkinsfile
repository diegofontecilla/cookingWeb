pipeline {
  agent any
    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'test_webapp', credentialsId: 'github_key', url: 'https://github.com/diegofontecilla/cookingWeb'
            }
        }
        stage('Build Docker Image') {
            steps {
                dir("/var/jenkins_home/workspace/cookingapp/app"){
                    sh "sudo docker build -t fontecilla/cookingapp ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pass-id', variable: 'dockerHubPwd')]) {
                    sh "sudo docker login -u fontecilla -p ${dockerHubPwd}"
                }
                sh 'sudo docker push fontecilla/cookingapp:latest'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'sudo docker stop thecookingwebapp && sudo docker rm thecookingwebapp'
                sh "sudo docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest"
            }
        }
        stage('Testing') {
            agent {
                docker {
                    image 'fontecilla/cookingapp'
                    label 'docker'
                }
            }
            // agent { label 'thecookingwebapp', docker 'fontecilla/cookingapp'}
            steps {
                sh 'echo hello diego'
            }
        }
    }
}
