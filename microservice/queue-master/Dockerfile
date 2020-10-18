FROM maven:3-jdk-11 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml /tmp/
RUN mvn clean package

from adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/queue-master.jar /queue-master.jar
RUN chmod a+rx ./queue-master.jar


ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./queue-master.jar", "--port=80"]

