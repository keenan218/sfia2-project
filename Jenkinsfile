pipeline{
    agent any
    environment {
        app_version = 'v1'
        rollback = 'false'
    }

    stages{
        stage('SSH to test vm, configure environment vars') {
            steps{
                withCredentials([string(credentialsId: 'DB_PASSWORD', variable: 'dbPwd'),
                                 string(credentialsId: 'SECRET_KEY', variable: 'secretKey')]) {
                    sh '''
                    ssh ubuntu@ec2-18-133-188-208.eu-west-2.compute.amazonaws.com -tty -o StrictHostKeyChecking=no << EOF
                    git clone https://github.com/keenan218/sfia2-project.git
                    cd sfia2-project
                    sudo -E DB_PASSWORD=$dbPwd SECRET_KEY=$secretKey docker-compose up -d --build
                    docker ps -a
                    docker exec sfia2-project_frontend_1 pytest --cov application
                    exit
                    >> EOF
                    '''
                }
            }
        }
    }
}

 //        stage('Test') {
 //            steps {
 //                sh ""
 //            }
 //        }

 //        stage('Download Docker and docker-compose') {
 //             steps {
 //                 sh '''
 //                 curl https://get.docker.com | sudo bash
 //                 sudo usermod -aG docker $(whoami)
 //                 sudo curl -L https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 //                 sudo chmod +x /usr/local/bin/docker-compose
 //                 '''
 //             }
 //         }

 //         stage('Build') {
 //             steps {
 //                 sh "docker-compose up -d --build"
 //             }
 //         }
 //        stage('Build Image'){
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