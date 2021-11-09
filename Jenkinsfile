pipeline {
    agent {
        dockerfile true
    }
    stages {
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
        stage ('Docker build and Push') {
          steps {
             sh 'docker build -t joygoswami/taco-cloud:latest .'
             sh 'docker push joygoswami/taco-cloud:latest'
          }
        }
    }
}