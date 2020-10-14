FROM maven:3-jdk-11 as build
WORKDIR /tmp

copy src /tmp/src
copy pom.xml /tmp/
run mvn clean -DskipTests package
#run --mount=type=cache,id=maven,target=/root/.m2,sharing=shared mvn clean package

from adoptopenjdk/openjdk11:alpine
COPY --from=build /tmp/target/queue-master.jar /queue-master.jar

run chmod a+rx ./queue-master.jar

#USER ${SERVICE_USER}


ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./queue-master.jar", "--port=80"]

