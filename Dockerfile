#FROM java:8-jdk-alpine
FROM maven:3.8.1-adoptopenjdk-11
#FROM openjdk:11
EXPOSE 8080
#COPY ./target/taco-cloud-0.0.1-SNAPSHOT.jar /usr/app/
ADD target/taco-cloud-0.0.1-SNAPSHOT.jar taco-cloud-0.0.1-SNAPSHOT.jar
#WORKDIR /usr/app
#RUN sh -c 'touch taco-cloud-0.0.1-SNAPSHOT.jar'
ENTRYPOINT ["java","-jar","/taco-cloud-0.0.1-SNAPSHOT.jar"]