package models

import "time"

type UserModel struct {
	Id           string    `json:"id"`
	FirstName    string    `json:"firstName"`
	LastName     string    `json:"LastName"`
	Password     string    `json:"password"`
	Email        string    `json:"email"`
	Phone        string    `json:"phone"`
	Token        string    `json:"token"`
	UserType     string    `json:"userType"`
	RefreshToken string    `json:"refreshToken"`
	CreatedAt    time.Time `json:"createdAt"`
	UpdatedAt    time.Time `json:"updatedAt"`
	User_id      string    `json:"userId"`
}
