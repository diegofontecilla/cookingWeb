
pipeline {
    agent any

    stages {
        stage('Docker build') {
            steps {
                sh 'sudo docker build -t fontecilla/cookingapp .'
                sh 'sudo docker push fontecilla/cookingapp'
                sh 'sudo docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest'
            }
        }
    }
}
