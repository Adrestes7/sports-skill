package main

import (
	routes "sportsapp-back/routes"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

func main() {

	router := gin.New()
	routes.EventRoutes(router)
	routes.AuthRoutes(router)
	routes.UserRoutes(router)

	router.Run(":5000")
}
