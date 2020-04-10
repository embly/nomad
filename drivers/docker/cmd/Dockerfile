FROM golang:1.13-buster

RUN apt-get update && apt-get install -y make git

WORKDIR /go/src/github.com/hashicorp/nomad
COPY GNUmakefile ./
COPY ./scripts/install-codecgen.sh ./scripts/install-protoc-gen-go.sh ./scripts/
RUN make deps
COPY . .
RUN cd drivers/docker/cmd && go build -o custom-docker
