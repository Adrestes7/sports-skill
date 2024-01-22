package bucket

import (
	"context"
	"log"
	"os"

	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/joho/godotenv"
)

var S3 *s3.Client = S3Connection()

func S3Connection() *s3.Client {
	err := godotenv.Load(".env")
	creds := credentials.NewStaticCredentialsProvider(os.Getenv("S3_KEY"), os.Getenv("S3_KEY_SECRET"), "")
	sdkConfig, err := config.LoadDefaultConfig(
		context.TODO(),
		config.WithRegion("us-east-1"),
		config.WithCredentialsProvider(creds),
	)

	if err != nil {
		log.Panic("there was an error connecting to aws bucket")
	}

	s3Client := s3.NewFromConfig(sdkConfig)

	return s3Client
}
