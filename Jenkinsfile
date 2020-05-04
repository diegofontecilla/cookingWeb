
pipeline {
    agent any
    }
    stages {
        stage('Docker build') {
            steps {
                sh 'docker build --file /home/cookingwebapp/app/Dockerfile --tag cookingwebapp:latest'
            }
        }
    }
}








// pipeline {
//     agent any
//     stages {
//         stage('Build') {
//             steps {
//                 echo 'Building thecookingwebapp'

//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Testing..'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 echo 'Deploying....'
//             }
//         }
//     }
// }
