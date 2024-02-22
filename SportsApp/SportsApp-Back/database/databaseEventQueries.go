package database

import (
	"context"
	"database/sql"
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
		id,category, subcategory, date, starttime, endtime, price, numberofpersons, address, title, description, photourls, city, country, mainphotourl) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)`

	_, err := DB.ExecContext(ctx, sqlStatement, event.Id, event.Category, event.Subcategory, event.Date, event.StartTime, event.EndTime, event.Price, event.NumberOfPersons, event.Address, event.Title, event.Description, event.PhotoUrls, event.City, event.Country, event.MainPhotoUrl)
	return err
}

func GetSubCategories(ctx context.Context, category string) ([]string, error) {
	var subcategories []string
	sqlStatement := `select name from sportskillschema.subcategory where category_name = $1`
	rows, err := DB.QueryContext(ctx, sqlStatement, category)
	if err != nil {
		log.Panic("There was an error reading subcategories from database")
		return subcategories, err
	}
	defer rows.Close()

	for rows.Next() {
		var subcategory string
		err = rows.Scan(&subcategory)
		if err != nil {
			log.Panic(err)
		}
		subcategories = append(subcategories, subcategory)
	}

	return subcategories, nil
}

func GetEventInfo(ctx context.Context, eventId string) (models.Event, error) {
	var event models.Event
	sqlStatement := `select * from sportskillschema.events where id = $1`
	err := DB.QueryRowContext(ctx, sqlStatement, eventId).Scan(&event.Id, &event.Category, &event.Subcategory, &event.Date, &event.StartTime, &event.EndTime, &event.Price, &event.NumberOfPersons, &event.Address, &event.Title, &event.Description, &event.PhotoUrls, &event.City, &event.Country, &event.MainPhotoUrl)
	if err == sql.ErrNoRows {
		log.Panic("there is no event with that event_id")
		return event, err
	}
	return event, nil
}

func SubscribeToEvent(ctx context.Context, subscribeToEvent models.SubscribeToEvent) error {
	sqlStatement := `INSERT INTO sportskillschema.user_event(user_id, event_id) VALUES ($1, $2)`
	_, err := DB.ExecContext(ctx, sqlStatement, subscribeToEvent.UserId, subscribeToEvent.EventId)

	return err
}
