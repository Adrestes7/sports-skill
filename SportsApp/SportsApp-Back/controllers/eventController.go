package controllers

import (
	"context"
	"log"
	"net/http"
	"sportsapp-back/bucket"
	"sportsapp-back/database"
	"sportsapp-back/models"
	"time"

	"github.com/gin-gonic/gin"
)

func GetCategories() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		categories := database.GetCategories(ctx)
		defer cancel()
		c.IndentedJSON(http.StatusOK, categories)
	}
}

func GetEvents() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		events := database.GetEvents(ctx)
		defer cancel()
		c.IndentedJSON(http.StatusOK, events)
	}
}

func GetSubCategories() gin.HandlerFunc {
	return func(c *gin.Context) {
		categoryName := c.Param("category_name")
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		subcategories, err := database.GetSubCategories(ctx, categoryName)
		defer cancel()

		if err != nil {
			log.Panic("there was an error loading subcategories")
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.IndentedJSON(http.StatusOK, subcategories)
	}
}

func CreateEvent() gin.HandlerFunc {
	return func(c *gin.Context) {

		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)

		var creaTeEvent models.CreateEvent
		if err := c.ShouldBind(&creaTeEvent); err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}

		photoUrls, err := bucket.PutImagesInBucket(c, creaTeEvent.Event.Id, creaTeEvent.Image)

		if err != nil {
			log.Panic("there was an error with s3")
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		creaTeEvent.Event.PhotoUrls = photoUrls
		err = database.CreateEvent(ctx, creaTeEvent.Event)
		defer cancel()

		if err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.IndentedJSON(http.StatusCreated, "event created successfully")
	}
}

func SubscribeToEvent() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		var subscribeToEvent models.SubscribeToEvent
		if err := c.ShouldBind(&subscribeToEvent); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}

		err := database.SubscribeToEvent(ctx, subscribeToEvent)
		defer cancel()

		if err != nil {
			log.Panic(err)
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.IndentedJSON(http.StatusCreated, "user subscribed to event successfully")
	}
}
