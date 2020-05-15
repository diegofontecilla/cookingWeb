
pipeline {
    agent any

    stages {
        stage('Docker build') {
            steps {
                echo 'This is going to work!'
                echo 'Now you need to instal docker in the jenkins container (myjenk)'
                // sh 'docker build --file /home/cookingwebapp/app/Dockerfile --tag cookingwebapp:latest'
                docker { image 'node:7-alpine' }
            }
        }
    }
}
