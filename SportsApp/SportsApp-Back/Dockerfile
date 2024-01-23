FROM golang:1.20

WORKDIR /app
ADD . /app

RUN go mod download


COPY *.go ./

RUN go build -o /application

EXPOSE 5000

ENTRYPOINT ["/application"]