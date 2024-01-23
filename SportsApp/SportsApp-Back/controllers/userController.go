package controllers

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"sportsapp-back/database"
	helper "sportsapp-back/helpers"
	"sportsapp-back/models"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

func HashPassword(password string) string {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	if err != nil {
		log.Panic(err)
	}
	return string(bytes)
}

func VerifyPassword(userPassword string, providedPassword string) (bool, string) {
	err := bcrypt.CompareHashAndPassword([]byte(providedPassword), []byte(userPassword))
	check := true
	msg := ""

	if err != nil {
		msg = fmt.Sprintf("email of password is incorrect")
		check = false
	}

	return check, msg
}

func Signup() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		var user models.UserModel

		if err := c.BindJSON(&user); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error:": err.Error()})
			defer cancel()
			return
		}

		user.CreatedAt, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		user.UpdatedAt, _ = time.Parse(time.RFC3339, time.Now().Format(time.RFC3339))
		user.Id = uuid.New().String()
		user.User_id = user.Id
		password := HashPassword(*&user.Password)
		user.Password = password

		token, refreshToken, _ := helper.GenerateAllTokens(*&user.Email, *&user.FirstName, *&user.LastName, *&user.UserType, *&user.User_id)
		user.Token = token
		user.RefreshToken = refreshToken

		err := database.CreateUser(ctx, user)
		defer cancel()
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error creating user": err.Error()})
		}
		c.JSON(http.StatusCreated, "the user was created successfully")
	}
}

func Login() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		var user models.UserModel

		if err := c.BindJSON(&user); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error:": err.Error()})
			defer cancel()
			return
		}
		foundUser, err := database.FindUserByEmail(ctx, user.Email)

		defer cancel()
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"email or password is incorrect": err.Error()})
			return
		}
		passIsValid, msg := VerifyPassword(*&user.Password, *&foundUser.Password)
		defer cancel()

		if passIsValid != true {
			c.JSON(http.StatusInternalServerError, gin.H{"error validating user": msg})
			return
		}

		token, refreshToken, _ := helper.GenerateAllTokens(foundUser.Email, foundUser.FirstName, foundUser.LastName, foundUser.UserType, foundUser.User_id)
		helper.UpdateAllTokens(token, refreshToken, foundUser.User_id)
		foundUser, err = database.FindUserById(ctx, foundUser.User_id)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		}
		c.JSON(http.StatusOK, foundUser)
	}
}

func GetProfile() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
		var profile models.Profile
		user_id := c.Param("user_id")
		if err := helper.MatchUsertoUid(c, user_id); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			defer cancel()
			return
		}
		profile, err := database.FindUserProfile(ctx, user_id)
		defer cancel()
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, profile)
	}
}
