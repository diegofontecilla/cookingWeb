
pipeline {
    agent any

    stages {
        stage('Docker build') {
            steps {
                echo 'This is going to work!'
                echo 'Now you need to instal docker in the jenkins container (myjenk)'
                // como chucha executo el dockerfile dentro del jenkins container siendo que esta fuera del contexto, por la reputa madre 
                // que lo mil pario!!!!
                sh 'sudo docker build -t fontecilla/cookingapp .'
                sh 'sudo docker container run -d --name thecookingwebapp --publish 3000:3000 fontecilla/cookingapp:latest'
            }
        }
    }
}
