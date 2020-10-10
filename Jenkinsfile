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
                                 string(credentialsId: 'SECRET_KEY', variable: 'secretKey'),
                                 string(credentialsId: 'TEST_DB_URI', variable: 'test_DB_URI')]) {
                    sh '''
                    ssh ubuntu@ec2-18-133-188-208.eu-west-2.compute.amazonaws.com -tty -o StrictHostKeyChecking=no << EOF
                    git clone https://github.com/keenan218/sfia2-project.git
                    cd sfia2-project

                    export DB_PASSWORD=$dbPwd
                    export SECRET_KEY=$secretKey
                    export TEST_DB_URI=$test_DB_URI

                    sudo -E DB_PASSWORD=$dbPwd SECRET_KEY=$secretKey TEST_DB_URI=$test_DB_URI docker-compose up -d --build
                    docker-compose ps

                    sudo -E TEST_DATABASE_URI=$test_DB_URI SECRET_KEY=$dbPwd DB_PASSWORD=$dbPwd docker exec sfia2-project_frontend_1 pytest  --cov-report term --cov=application
                    sudo -E TEST_DATABASE_URI=$test_DB_URI SECRET_KEY=$dbPwd DB_PASSWORD=$dbPwd docker exec sfia2-project_backend_1 pytest  --cov-report term --cov=application

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