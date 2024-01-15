package helpers

import (
	"errors"

	"github.com/gin-gonic/gin"
)

func MatchUsertoUid(context *gin.Context, userId string) (err error) {
	userType := context.GetString("userType")
	uid := context.GetString("uid")
	err = nil
	if userType == "USER" && uid != userId {
		err = errors.New("Unauthorized to access this resource")
		return err
	}

	err = CheckUserType(context, userType)
	return err
}

func CheckUserType(context *gin.Context, role string) (err error) {
	userType := context.GetString("userType")
	err = nil
	if userType != role {
		err = errors.New("Unauthorized to access this resource")
		return err
	}
	return err
}
