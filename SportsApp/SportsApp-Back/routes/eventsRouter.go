package routes

import (
	controller "sportsapp-back/controllers"

	"github.com/gin-gonic/gin"
)

func EventRoutes(incomingRoutes *gin.Engine) {
	incomingRoutes.GET("/category", controller.GetCategories())
	incomingRoutes.GET("/subcategory/:category_name", controller.GetSubCategories())
	incomingRoutes.GET("/events", controller.GetEvents())
	incomingRoutes.POST("/event", controller.CreateEvent())
	incomingRoutes.GET("/event/:event_id", controller.GetEventInfo())
}
