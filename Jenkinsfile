pipeline {
    agent any

    environment {
        IMAGE_NAME = "spring-petclinic"
        DOCKERHUB_CREDS = credentials('dockerhub-creds-id')

        ARTIFACTORY_USER = credentials('artifactory-user')
        ARTIFACTORY_PASS = credentials('artifactory-pass')
    }

    tools {
        jdk 'jdk17'
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
            }
        }

        stage('Package') {
            steps {
                sh './mvnw package -DskipTests -s settings.xml'
            }
        }

        stage('Publish to Artifactory (Bonus)') {
            steps {
                sh '''
                ./mvnw deploy -s settings.xml \
                -DaltDeploymentRepository=artifactory::default::https://your-artifactory-url/artifactory/libs-release-local
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin
                docker tag $IMAGE_NAME:latest your-dockerhub/$IMAGE_NAME:latest
                docker push your-dockerhub/$IMAGE_NAME:latest
                '''
            }
        }
    }

    post {
        always {
            junit '**/target/surefire-reports/*.xml'
        }
    }
}
