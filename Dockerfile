# ----------- BUILD STAGE -----------
FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy source
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# ----------- RUNTIME STAGE -----------
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy built jar from builder stage
COPY --from=builder /build/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
