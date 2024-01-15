package routes

import (
	controller "sportsapp-back/controllers"

	"github.com/gin-gonic/gin"
)

func EventRoutes(incomingRoutes *gin.Engine) {
	incomingRoutes.GET("/category", controller.GetCategories())
	incomingRoutes.GET("/events", controller.GetEvents())
	incomingRoutes.POST("/event", controller.CreateEvent())
}
