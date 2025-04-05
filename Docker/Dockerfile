# Build Stage
FROM gradle:7-alpine AS builder
WORKDIR /app
COPY web-app/ /app
# Build and test the project
RUN   gradle build && gradle test
 

# ---------- Runtime Stage ----------
FROM eclipse-temurin:17-jre-alpine AS runtime

WORKDIR /app

# Copy only the built JAR file from the builder stage
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8081
# Run the app
CMD ["java", "-jar", "app.jar"]
