package controllers

import (
	"context"
	"log"
	"net/http"
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

func CreateEvent() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		var event models.Event
		if err := c.BindJSON(&event); err != nil {
			panic(err)
		}
		err := database.CreateEvent(ctx, event)
		defer cancel()

		if err != nil {
			log.Panic(err)
		}
		c.IndentedJSON(http.StatusCreated, "event created successfully")
	}
}
