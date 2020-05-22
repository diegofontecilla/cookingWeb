
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t fontecilla/cookingapp .'
            }
        }
        // stage('Push Docker Image') {
        //     steps {
        //         withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        //             sh 'sudo docker push fontecilla/cookingapp'
        //         }
        //         withCredentials([string(credentialsId: 'docker-password', variable: 'docker-password')]) {
        //         }
        //     }
        // }
        stage('Run Docker Image') {
            steps {
                sh 'sudo docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest'
            }
        }
    }
}
