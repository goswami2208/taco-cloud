#FROM java:8-jdk-alpine
FROM openjdk:11
COPY ./target/taco-cloud-0.0.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
RUN sh -c 'touch taco-cloud-0.0.1-SNAPSHOT.jar'
ENTRYPOINT ["java","-jar","taco-cloud-0.0.1-SNAPSHOT.jar"]