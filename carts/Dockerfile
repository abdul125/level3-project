FROM maven:3-jdk-8 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml  /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk8:alpine

COPY --from=build /tmp/target/carts.jar /carts.jar
RUN chmod a+rx ./carts.jar
USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="abdul" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Carts" \
  org.label-schema.description="REST API for carts service" \
  org.label-schema.url="https://github.com/microservices-demo/carts" \
  org.label-schema.vcs-url="github.com:microservices-demo/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"
ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./carts.jar", "--port=80"]
