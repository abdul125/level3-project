FROM bryandollery/maven-repo as build

WORKDIR /tmp
copy src /tmp/src
copy pom.xml /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/orders.jar /orders.jar 

run chmod a+rx ./orders.jar
#USER ${SERVICE_USER}
#RUN chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./orders.jar


ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./orders.jar", "--port=80"]

