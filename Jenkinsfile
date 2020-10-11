pipeline{
    agent any
    environment {
        app_version = 'v1'
        rollback = 'false'
    }

    stages{
        stage('SSH to test vm, configure environment vars') {
            steps{
                script{
                    if (env.rollback == 'false'){
                        withCredentials([string(credentialsId: 'DB_PASSWORD', variable: 'dbPwd'),
                                         string(credentialsId: 'SECRET_KEY', variable: 'secretKey'),
                                         string(credentialsId: 'DATABASE_URI', variable: 'dbUri'),
                                         string(credentialsId: 'TEST_DB_URI', variable: 'tDB_URI'),
                                         file(credentialsId: 'EWS_EC2_KEY', variable: 'SSH_PEM')]) {

                            sh '''
                            ssh -tty -o StrictHostKeyChecking=no ubuntu@ec2-18-133-160-243.eu-west-2.compute.amazonaws.com  << EOF
                            git clone https://github.com/keenan218/sfia2-project.git
                            cd sfia2-project

                            export DB_PASSWORD=$dbPwd
                            export SECRET_KEY=$secretKey
                            export TEST_DB_URI=$tDB_URI

                            sudo -E TEST_DATABASE_URI=$tDB_URI SECRET_KEY=$dbPwd DB_PASSWORD=$dbPwd docker exec sfia2-project_frontend_1 pytest  --cov-report term --cov=application

                            exit
                            >> EOF
                            '''
                        }
                    }
                }
            }
        }
        stage('SSH to prod vm'){
            steps{
                script{
                    if (env.rollback == 'false'){
                        withCredentials([string(credentialsId: 'DB_PASSWORD', variable: 'dbPwd'),
                                     string(credentialsId: 'SECRET_KEY', variable: 'secretKey'),
                                     string(credentialsId: 'DATABASE_URI', variable: 'dbUri'),
                                     string(credentialsId: 'TEST_DB_URI', variable: 'tDB_URI'),
                                     file(credentialsId: 'EWS_EC2_KEY', variable: 'SSH_PEM')]) {
                            sh '''
                            ssh -tty -o StrictHostKeyChecking=no ubuntu@18.130.161.46 << EOF

                            git clone https://github.com/keenan218/sfia2-project.git
                            cd sfia2-project

                            sudo -E DB_PASSWORD=$dbPwd SECRET_KEY=$secretKey DATABASE_URI=$dbUri docker-compose up -d --build
                            docker-compose ps -a

                            mysql -h test-db.csnk6wgrqbvm.eu-west-2.rds.amazonaws.com -P 3306 -u root -p$dbPwd

                            SOURCE database/Create.sql;

                            exit
                            EOF
                            '''
                        }
                    }
                }
            }
        }
    }
}

//sudo -E TEST_DATABASE_URI=$tDB_URI SECRET_KEY=$dbPwd DB_PASSWORD=$dbPwd docker exec -it sfia2-project_backend_1 pytest  --cov-report term --cov=application




 //        stage('Test') {
 //            steps {
 //                sh ""
 //            }
 //        }


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