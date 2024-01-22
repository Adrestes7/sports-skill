package bucket

import (
	"context"
	"fmt"
	"log"
	"mime/multipart"

	"github.com/aws/aws-sdk-go-v2/service/s3"
)

var bucketName = "tribu-sportskil-bucket"

func PutImagesInBucket(c context.Context, eventId string, files []*multipart.FileHeader) ([]string, error) {
	var photoUrls []string
	var err error = nil
	for i := 0; i < len(files); i++ {
		file, err := files[i].Open()
		if err != nil {
			log.Panic("There was an error getting the image")
			return photoUrls, err
		}
		defer file.Close()
		key := fmt.Sprintf("eventPhotos/%s/file%d.jpg", eventId, i)
		_, err = S3.PutObject(context.TODO(), &s3.PutObjectInput{
			Bucket: &bucketName,
			Key:    &key,
			Body:   file,
		})
		if err != nil {
			errorMsg := fmt.Sprintf("There was an error uploading the image: [%s] to s3", key)
			log.Panic(errorMsg)
			return photoUrls, err
		}
		path := fmt.Sprintf("https://tribu-sportskil-bucket.s3.amazonaws.com/%s", key)
		photoUrls = append(photoUrls, path)
	}
	return photoUrls, err
}
