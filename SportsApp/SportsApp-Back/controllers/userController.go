package controllers

import (
	"net/http"
	"sportsapp-back/database"
	helper "sportsapp-back/helpers"
	"sportsapp-back/models"

	"github.com/gin-gonic/gin"
)

func HashPassword()

func VerifyPassword()

func Signup() gin.HandlerFunc {
	return func(context *gin.Context) {
		var userModel models.UserModel

		if err := context.BindJSON(&userModel); err != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error:": err.Error()})
			return
		}

	}
}

func Login()

func GetProfile() gin.HandlerFunc {
	return func(context *gin.Context) {
		var profile models.Profile
		user_id := context.Param("user_id")

		if err := helper.MatchUsertoUid(context, user_id); err != nil {
			context.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}
		profile, err := database.FindUserProfile(user_id)

		if err != nil {
			context.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}
		context.JSON(http.StatusOK, profile)
	}
}
