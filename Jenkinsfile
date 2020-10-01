pipeline{
    agent any
    environment {
        app_version = 'v1'
        rollback = 'false'
       // withCredentials([string(credentialsId: 'SECRET_KEY', variable: 'SECRET_KEY'),
       //                string(credentialsId: 'DB_PASSWORD', variable: 'DB_PASSWORD')])
        DB_PASSWORD = '${DB_PASSWORD}'
        SECRET_KEY = '${SECRET_KEY}'
    }
    stages{
//         stage('Build Image'){
//             steps{
//                 script{
//                     if (env.rollback == 'false'){
//                         image = docker.build("keenan218/sfia2-project")
//                     }
//                 }
//             }
//         }
//         stage('Tag & Push Image'){
//             steps{
//                 script{
//                     if (env.rollback == 'false'){
//                         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
//                             image.push("${env.app_version}")
//                         }
//                     }
//                 }
//             }
//         }
    stage('Deploy App'){
        steps{
            sh "docker-compose up -d"
        }
    }

    stage('Build') {
        steps {
            sh "docker-compose up -d"
        }
    }
    stage('Test') {
        steps {
            sh "docker ps -a"
        }
    }
}