pipeline {
  agent any
    stages {
        stage('Build Docker Image') {
            steps {
                dir("/var/jenkins_home/cookingapp/app"){
                    echo "PRINTING"
                    sh 'sudo docker build -t fontecilla/cookingapp .'
                }
            }
        }
    }
}
