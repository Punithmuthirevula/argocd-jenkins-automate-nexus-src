# Stage 1: Build WAR
FROM maven:3.9-eclipse-temurin-8 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run in Tomcat
FROM tomcat:9.0-jdk8
RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/my-app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
