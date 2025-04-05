# Spring Boot Docker Application

A Dockerized Spring Boot application with Gradle build and Temurin runtime.

## Quick Start

### Prerequisites
- Docker 20.10+
- Java 17 (for local development)

### Usage

1. **Build the Docker image**:
```bash
docker build -t springboot-app .
```

2. **Run the container**:
```bash
docker run -p 8081:8081 --name myapp springboot-app
```

3. **Access the application**:
```
http://localhost:8081
```

## Configuration

### Environment Variables
Add these to `docker run` command using `-e`:
```bash
-e "SPRING_PROFILES_ACTIVE=prod"
```

### Volumes
For development with hot-reload (if enabled):
```bash
-v $(pwd)/web-app:/app
```

## Key Details

- **Port**: 8081 (EXPOSE 8081)
- **Build Process**:
  - Uses Gradle 7 Alpine image
  - Runs `gradle build test`
  - Creates executable JAR in `/app/build/libs/`
- **Runtime**:
  - Eclipse Temurin 17 JRE
  - Non-root user context
  - Single JAR deployment

## Development Notes

1. **Rebuilding**:
```bash
docker build --no-cache -t springboot-app .
```

2. **Test Results**:
View test reports in container:
```bash
docker exec myapp cat /app/build/test-results/test/*.xml
```

3. **Docker Hub** (optional):
```bash
docker tag springboot-app yourusername/springboot-app:latest
docker push yourusername/springboot-app
```
### Image build
![image build](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Docker/screenshots/buildimage.png)
### image run
![image run](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Docker/screenshots/cotainer.png)

