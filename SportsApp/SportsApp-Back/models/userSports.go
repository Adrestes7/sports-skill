package models

type UserSports struct {
	SportName       string  `json:"sportName"`
	UserGrade       float32 `json:"userGrade"`
	FeedbackGrade   float32 `json:"feedbackGrade"`
	NumberOfPersons int     `json:"numberOfPersons"`
}
