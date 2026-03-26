node {

    stage('Checkout') {
        checkout scm
    }

    stage('Compile') {
        sh './mvnw clean compile -s settings.xml'
    }

    stage('Test') {
        sh './mvnw test -s settings.xml'
        junit '**/target/surefire-reports/*.xml'
    }

    stage('Package') {
        sh './mvnw package -DskipTests -s settings.xml'
    }

    stage('Build Docker Image') {
        sh 'docker build -t spring-petclinic:latest .'
    }

    stage('Save Docker Image') {
        sh 'docker save -o spring-petclinic.tar spring-petclinic:latest'
    }

    stage('Archive') {
        archiveArtifacts artifacts: '*.tar', fingerprint: true
    }
}
