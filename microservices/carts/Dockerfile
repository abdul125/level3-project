FROM maven:3-jdk-11 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml  /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/carts.jar /carts.jar
RUN chmod a+rx ./carts.jar

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./carts.jar", "--port=80"]
