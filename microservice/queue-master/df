FROM maven:3-jdk-11 as build

WORKDIR /tmp
COPY src /tmp/src
COPY pom.xml /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /tmp/target/queue.jar /queue.jar

ENV	SERVICE_USER=myuser \
	SERVICE_UID=10001 \
	SERVICE_GROUP=mygroup \
	SERVICE_GID=10001

RUN	addgroup -g ${SERVICE_GID} ${SERVICE_GROUP} && \
	adduser -g "${SERVICE_NAME} user" -D -H -G ${SERVICE_GROUP} -s /sbin/nologin -u ${SERVICE_UID} ${SERVICE_USER} && \
	apk add --update libcap && \
	mkdir /lib64 && \
	ln -s /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server/libjvm.so /lib/libjvm.so && \
	ln -s /usr/lib/jvm/java-1.8-openjdk/lib/amd64/jli/libjli.so /lib/libjli.so && \
	setcap 'cap_net_bind_service=+ep' $(readlink -f $(which java))

COPY --from=build /tmp/target/queue.jar /queue.jar

RUN chmod a+rx ./queue.jar #chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./queue.jar

USER ${SERVICE_USER}
ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./queue.jar", "--port=80"]
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","./queue.jar", "--port=80"]
