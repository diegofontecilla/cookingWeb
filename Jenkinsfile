
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t fontecilla/cookingapp .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pass-id', variable: 'docker-pass')]) {
                    sh 'sudo docker push fontecilla/cookingapp'
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                sh 'sudo docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest'
            }
        }
    }
}
