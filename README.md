# Spring PetClinic - Jenkins Pipeline Demo

## Overview
This project demonstrates a Jenkins CI pipeline using Spring PetClinic.

## Pipeline Stages
1. Compile the code using Maven
2. Run unit tests
3. Package the application
4. Build a Docker image
5. Push Docker image to DockerHub
6. (Bonus) Publish artifacts to JFrog Artifactory

## Dependency Management
Dependencies are resolved using JCenter (via Maven settings.xml)

## Prerequisites
- Docker
- Jenkins
- Java 17

## Run Locally

### Build JAR
./mvnw clean package

### Build Docker Image
docker build -t spring-petclinic .

### Run Container
docker run -d -p 8080:8080 spring-petclinic

Access:
http://localhost:8080

## Jenkins Setup
- Add DockerHub credentials
- Add Artifactory credentials
- Run pipeline job

## Docker Image
your-dockerhub/spring-petclinic:latest
