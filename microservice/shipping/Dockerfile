FROM maven:3-jdk-11 as build
WORKDIR /tmp

copy src /tmp/src
copy pom.xml /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/shipping.jar /shipping.jar
RUN chmod a+rx ./shipping.jar

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./shipping.jar", "--port=80"]
