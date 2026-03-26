# Spring PetClinic - Jenkins CI Pipeline

## Technologies Used

* Java 17
* Maven (Maven Wrapper - `mvnw`)
* Docker
* Jenkins


## Pipeline Stages

The Jenkins pipeline performs the following steps:

1. **Checkout**
   Retrieves source code from the Git repository.

2. **Compile**
   Compiles the application using Maven.

3. **Test**
   Executes unit tests and generates reports.

4. **Package**
   Builds a runnable JAR file.

5. **Docker Build**
   Creates a Docker image from the application.


## Project Structure

```
spring-petclinic-demo/
    src/                 # Application source code
    pom.xml              # Maven configuration
    mvnw                 # Maven wrapper
    mvnw.cmd
    .mvn/
    Dockerfile           # Docker image build 
    Jenkinsfile          # Jenkins 
    settings.xml         # Maven repository 
    README.md
```

## Build and Run Locally

### Step 1: Build Docker Image

```bash
docker build -t spring-petclinic .
```

### Step 2: Run Container

```bash
docker run -d -p 8080:8080 spring-petclinic
```

### Access Application

Open in browser:

```
http://localhost:8080
```

## Jenkins Setup

1. Create a **Pipeline Job** in Jenkins
2. Select **Pipeline script from SCM**
3. Configure Git repository:

   ```
   https://github.com/<your-repo>.git
   ```
4. Set branch:

   ```
   */main
   ```
5. Save and run the pipeline
