FROM java:openjdk-8-alpine as builder

RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
#RUN mvn clean package

FROM java:openjdk-8-alpine as runtime

COPY --from=builder /app/source/target/*.jar /app/app.jar
#expose 80
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./app.jar", "--port=80"]
