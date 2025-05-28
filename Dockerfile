FROM maven:3.8.6-jdk-11 AS build

RUN git clone https://github.com/EduardoDuctra/trabalho2_SO.git /app

WORKDIR /app

RUN mvn clean package

FROM tomcat:9-jdk11-openjdk-slim

COPY --from=build /app/target/usuario_tarefa.war /usr/local/tomcat/webapps/usuario_tarefa.war

EXPOSE 8080
