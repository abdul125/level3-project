FROM maven:3-jdk-11 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/orders.jar /orders.jar 
RUN chmod a+rx ./orders.jar

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./orders.jar", "--port=80"]

