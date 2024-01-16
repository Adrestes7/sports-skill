package models

type Profile struct {
	Id        string       `json:"id"`
	Name      string       `json:"name"`
	LastName  string       `json:"lastName"`
	Age       string       `json:"age"`
	Address   string       `json:"address"`
	PhotoPath string       `json:"photoPath"`
	Email     string       `json:"email"`
	Sports    []UserSports `json:"sports"`
}
