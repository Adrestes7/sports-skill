package models

import "github.com/lib/pq"

type Event struct {
	Id              string         `json:"id" form:"id"`
	Category        string         `json:"category" form:"category"`
	Subcategory     string         `json:"subcategory" form:"subcategory"`
	Date            string         `json:"date"`
	StartTime       string         `json:"startTime"`
	EndTime         string         `json:"endTime"`
	Price           string         `json:"price"`
	NumberOfPersons int            `json:"numberOfPersons"`
	Address         string         `json:"address"`
	Title           string         `json:"title"`
	Description     string         `json:"description"`
	PhotoUrls       pq.StringArray `json:"photoUrls"`
	City            string         `json:"city"`
	Country         string         `json:"country"`
	MainPhotoUrl    string         `json:"mainPhotoUrl"`
}
