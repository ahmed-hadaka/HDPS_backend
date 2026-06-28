# Build stage
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Runtime stage
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/Backend-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 7860

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]