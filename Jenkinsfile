name: Java CI with Semgrep

on:
  push:
    branches: ["main"]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # Checkout (Jenkins: Checkout)
      - name: Checkout code
        uses: actions/checkout@v4

      # Setup Java (Required for Maven)
      - name: Set up JDK
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
          cache: 'maven'

      # Compile (Jenkins: Compile)
      - name: Compile application
        run: ./mvnw clean compile -s settings.xml

      # Test (Jenkins: Test)
      - name: Run unit tests
        run: ./mvnw test -s settings.xml

      # Publish test reports (replacement for junit step)
      - name: Publish test results
        if: always()
        uses: dorny/test-reporter@v1
        with:
          name: Maven Tests
          path: '**/target/surefire-reports/*.xml'
          reporter: java-junit

      # Semgrep Security Scan (NEW)
      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
        with:
          config: >
            p/security-audit
            p/owasp-top-ten
        env:
          SEMGREP_APP_TOKEN: ${{ secrets.SEMGREP_APP_TOKEN }}
          SEMGREP_FAIL_ON: ERROR

      # Package (Jenkins: Package)
      - name: Package application
        run: ./mvnw package -DskipTests -s settings.xml

      # Docker Build (Jenkins: Docker Build)
      - name: Build Docker image
        run: docker build -t spring-petclinic:latest .
