package database

import (
	"context"
	"log"
	"sportsapp-back/models"
)

func GetCategories(ctx context.Context) []models.Category {
	rows, err := DB.QueryContext(ctx, "select * from sportskillschema.category")

	if err != nil {
		panic(err)
	}

	defer rows.Close()

	var categories []models.Category
	for rows.Next() {
		var category models.Category
		err := rows.Scan(&category.Id, &category.Name, &category.Icon, &category.Image)
		if err != nil {
			log.Panic(err)
		}
		categories = append(categories, category)
	}
	return categories
}

func GetEvents(ctx context.Context) []models.Event {
	rows, err := DB.QueryContext(ctx, "select * from sportskillschema.events")

	if err != nil {
		panic(err)
	}

	defer rows.Close()

	var events []models.Event
	for rows.Next() {
		var event models.Event
		err := rows.Scan(&event.Id, &event.Category, &event.Subcategory, &event.Date, &event.StartTime, &event.EndTime, &event.Price, &event.NumberOfPersons, &event.Address, &event.Title, &event.Description, &event.PhotoUrls, &event.City, &event.Country, &event.MainPhotoUrl)
		if err != nil {
			log.Fatal(err)
		}
		events = append(events, event)
	}
	return events
}

func CreateEvent(ctx context.Context, event models.Event) error {
	sqlStatement := `INSERT INTO sportskillschema.events(
		category, subcategory, date, starttime, endtime, price, numberofpersons, address, title, description, photourls, city, country, mainphotourl) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)`

	_, err := DB.Exec(sqlStatement, event.Category, event.Subcategory, event.Date, event.StartTime, event.EndTime, event.Price, event.NumberOfPersons, event.Address, event.Title, event.Description, event.PhotoUrls, event.City, event.Country, event.MainPhotoUrl)
	return err
}
