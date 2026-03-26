pipeline {
    agent any

    environment {
        IMAGE_NAME = "spring-petclinic"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }

        stage('Compile') {
            steps {
                sh './mvnw clean compile -s settings.xml'
            }
        }

        stage('Test') {
            steps {
                sh './mvnw test -s settings.xml'
                junit '**/target/surefire-reports/*.xml'
            }
        }

        stage('Package') {
            steps {
                sh './mvnw package -DskipTests -s settings.xml'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Save Docker Image (TAR)') {
            steps {
                sh '''
                docker save -o $IMAGE_NAME.tar $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }

        stage('Archive Image') {
            steps {
                archiveArtifacts artifacts: '*.tar', fingerprint: true
            }
        }
    }
}
