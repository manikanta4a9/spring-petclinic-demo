node {

    stage('Checkout') {
        echo "Cloning repository..."
        checkout scm
    }

    stage('Compile') {
        echo "Compiling application..."
        sh './mvnw clean compile -s settings.xml'
    }

    stage('Test') {
        echo "Running unit tests..."
        sh './mvnw test -s settings.xml'

        echo "Publishing test reports..."
        junit '**/target/surefire-reports/*.xml'
    }

    stage('Package') {
        echo "Packaging application..."
        sh './mvnw package -DskipTests -s settings.xml'
    }

    stage('Docker Build') {
        echo "Building Docker image..."
        sh 'docker build -t spring-petclinic:latest .'
    }
}
