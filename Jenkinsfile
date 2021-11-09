pipeline {
    agent any
    tools {
        maven 'maven-3.6.3'
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
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
        stage('Deploy'){
            steps {
                sh "docker run --name taco-cloud -d -p 8081:8081 joygoswami/taco-cloud:${TAG}"
            }
        }
    }
}