# Use a suitable OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from your target directory to the container.
# The name of your JAR file may differ.
COPY target/Backend-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 7860

# Run the JAR file
ENTRYPOINT ["java", "-jar", "Backend-0.0.1-SNAPSHOT.jar"]