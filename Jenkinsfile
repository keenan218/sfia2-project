pipeline{
    agent any
    environment {
        app_version = 'v1'
        rollback = 'false'

        //DB_PASSWORD = '${DB_PASSWORD}'
        //SECRET_KEY = '${SECRET_KEY}'
    }

    withCredentials([string(credentialsId: 'DB_PASSWORD', variable: 'dbPwd'), string(credentialsId: 'SECRET_KEY', variable: 'secretKey')]) {
        // some block
        sh 'echo $DB_PASSWORD'
    }

    stages{
        stage('configure credential') {
            steps{
                withCredentials([string(credentialsId: 'DB_PASSWORD', variable: 'dbPwd'), string(credentialsId: 'SECRET_KEY', variable: 'secretKey')]) {
                    // some block
                    sh 'echo $DB_PASSWORD'
                }
            }
        }

        stage('Download Docker and docker-compose') {
            steps {
                sh '''
                curl https://get.docker.com | sudo bash
                sudo usermod -aG docker $(whoami)
                sudo curl -L https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
                sudo chmod +x /usr/local/bin/docker-compose
                '''
            }
        }
        stage('Build') {
            steps {
                sh "docker-compose up"
            }
        }
        stage('Test') {
            steps {
                sh "docker ps -a"
            }
        }
    }
}
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
       //  stage('Declare variables'){
       //      steps{
       //          sh
       //      }
       //  }
       //  stage('Deploy App'){
       //      steps{
       //          sh "docker-compose up -d"
       //      }
       //  }