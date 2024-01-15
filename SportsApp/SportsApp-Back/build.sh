set -xe

go get github.com/gin-gonic/gin    //Have tried without quotation marks

go get github.com/aws/aws-sdk-go-v2/aws
go get github.com/aws/aws-sdk-go-v2/config
go get github.com/aws/aws-sdk-go-v2/service/secretsmanager
go get -u github.com/lib/pq

go build application.go