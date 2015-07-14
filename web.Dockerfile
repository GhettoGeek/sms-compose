FROM golang:1.3.3

RUN mkdir -p /usr/go
WORKDIR /usr/go
ENV GOPATH /usr/go

RUN go get github.com/tools/godep

ENV PATH /usr/go/bin/:$PATH

RUN godep get github.com/votinginfoproject/sms-web

WORKDIR /usr/go/src/github.com/votinginfoproject/sms-web

RUN touch .env

RUN godep go test ./...

EXPOSE 8080

CMD godep go run sms-web.go
