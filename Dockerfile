FROM golang:alpine AS builder

LABEL maintainer="jingfelix"
LABEL stage=builder

COPY . /go/src/demo

WORKDIR /go/src/demo

RUN go build -o bin/main



FROM alpine

COPY --from=builder /go/src/demo/ /go/src/demo/
WORKDIR /go/src/demo

EXPOSE 8080

CMD bin/main