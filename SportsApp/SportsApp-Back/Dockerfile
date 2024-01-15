FROM golang:1.20

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /application

EXPOSE 5000

ENTRYPOINT ["/application"]