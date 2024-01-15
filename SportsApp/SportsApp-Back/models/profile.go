package models

type Profile struct {
	Id        string
	Name      string
	LastName  string
	Age       string
	Address   string
	PhotoPath string
	Email     string
	Sports    []UserSports
}
