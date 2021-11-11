pipeline {
    /* agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    } */
    agent any
        tools {
            maven 'apache-maven-3.8.3'
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {

        stage('Tooling versions') {
              steps {
                sh '''
                  docker --version
                  docker compose version
                '''
              }
            }
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("joygoswami/taco-cloud:${TAG}")
                }
            }
        }
	    stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                        docker.withRegistry('https://registry.hub.docker.com', 'my_dockerhub_id') {
                        docker.image("joygoswami/taco-cloud:${TAG}").push()
                        docker.image("joygoswami/taco-cloud:${TAG}").push("latest")
                    }
                }
            }
        }
        /* stage('Deploy'){
            steps {
                sh "docker run --name taco-cloud -d -p 8081:8080 joygoswami/taco-cloud:${TAG}"
            }
        } */
        /* stage('Deploy to AWS') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                withAWS(credentials: 'aws-credentials', region: env.AWS_REGION) {
                    sh './gradlew awsCfnMigrateStack awsCfnWaitStackComplete -PsubnetId=$SUBNET_ID -PdockerHubUsername=$DOCKER_HUB_LOGIN_USR -Pregion=$AWS_REGION'
                }
            }
        } */
    }
}