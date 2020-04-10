FROM golang:1.13-buster

RUN apt-get update && apt-get install -y make git

WORKDIR /go/src/github.com/hashicorp/nomad
COPY GNUmakefile ./
RUN make deps
COPY . .
RUN go build -o bin && strip bin && mv bin /bin/nomad
