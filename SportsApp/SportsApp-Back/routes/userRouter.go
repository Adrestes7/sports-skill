package routes

import (
	controller "sportsapp-back/controllers"
	"sportsapp-back/middleware"

	"github.com/gin-gonic/gin"
)

func UserRoutes(incomingRoutes *gin.Engine) {
	incomingRoutes.Use(middleware.Authenticate())
	incomingRoutes.GET("/profile/:user_id", controller.GetProfile())
}
