FROM golang:1.7-alpine

COPY . /go/src/github.com/microservices-demo/user/
WORKDIR /go/src/github.com/microservices-demo/user/

RUN apk update
RUN apk add git
RUN go get -v github.com/Masterminds/glide 
RUN glide install && CGO_ENABLED=0 go build -a -installsuffix cgo -o /user main.go

FROM alpine:3.4

USER root

ENV MONGO_HOST user-db:27017
ENV HATEOAS user
ENV USER_DATABASE mongodb

WORKDIR /

COPY --from=0 /user /
 
CMD ["/user", "-port=80"]
EXPOSE 80
