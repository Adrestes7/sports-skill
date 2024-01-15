package main

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	routes "sportsapp-back/routes"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/secretsmanager"
	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
	_ "github.com/lib/pq"
)

var DB *sql.DB

type Credentials struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type Category struct {
	Id    string `json:"id"`
	Name  string `json:"name"`
	Icon  string `json:"icon"`
	Image string `json:"image"`
}

type UserSports struct {
	SportName       string
	UserGrade       float32
	FeedbackGrade   float32
	NumberOfPersons int
}
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

type Event struct {
	Id              string         `json:"id"`
	Category        string         `json:"category"`
	Subcategory     string         `json:"subcategory"`
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

func getAWSSecrets() Credentials {
	var dbCredentials Credentials

	secretName := "rds!db-32bb22db-67d7-4387-9d02-10b69528bd0d"
	region := "us-east-1"

	config, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion(region))
	if err != nil {
		log.Fatal(err)
	}

	// Create Secrets Manager client
	svc := secretsmanager.NewFromConfig(config)

	input := &secretsmanager.GetSecretValueInput{
		SecretId:     aws.String(secretName),
		VersionStage: aws.String("AWSCURRENT"), // VersionStage defaults to AWSCURRENT if unspecified
	}

	result, err := svc.GetSecretValue(context.TODO(), input)
	if err != nil {
		// For a list of exceptions thrown, see
		// https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
		log.Fatal(err.Error())
	}

	// Decrypts secret using the associated KMS key.
	var secretString string = *result.SecretString

	err = json.Unmarshal([]byte(secretString), &dbCredentials)

	if err != nil {
		fmt.Println(err)
	}

	return dbCredentials
}

func openDatabaseconnection() {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=require",
		"sports-skill.czke2wiuefcl.us-east-1.rds.amazonaws.com", 5432, "sportsSkillDB", "43H)<gGgTd#j:[G8UQME6$I4M3rD", "SportsSkill")

	db, err := sql.Open("postgres", psqlInfo)
	DB = db
	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully connected!")
}

func getCategories(context *gin.Context) {

	rows, err := DB.Query("select * from sportskillschema.category")

	if err != nil {
		panic(err)
	}

	defer rows.Close()

	var categories []Category
	for rows.Next() {
		var category Category
		err := rows.Scan(&category.Id, &category.Name, &category.Icon, &category.Image)
		if err != nil {
			log.Fatal(err)
		}
		categories = append(categories, category)
	}

	context.IndentedJSON(http.StatusOK, categories)
}

func getProfile(context *gin.Context) {
	var profile Profile
	id := context.Param("id")

	rows, err := DB.Query("select profile.id, profile.name, profile.last_name, profile.age, profile.address, profile.photo_path, profile.email, user_sports.sportsname, user_sports.usergrade, user_sports.feedback_grade, user_sports.number_of_persons from sportskillschema.profile as profile join sportskillschema.user_sports as user_sports on profile.id = user_sports.user_id where profile.id = $1", id)
	if err != nil {
		panic(err)
	}
	defer rows.Close()

	for rows.Next() {
		var sport UserSports
		err := rows.Scan(&profile.Id, &profile.Name, &profile.LastName, &profile.Age, &profile.Address, &profile.PhotoPath, &profile.Email, &sport.SportName, &sport.UserGrade, &sport.FeedbackGrade, &sport.NumberOfPersons)
		if err != nil {
			log.Fatal(err)
		}
		profile.Sports = append(profile.Sports, sport)
	}

	context.JSON(http.StatusOK, profile)
}

func getEvents(context *gin.Context) {
	rows, err := DB.Query("select * from sportskillschema.events")

	if err != nil {
		panic(err)
	}

	defer rows.Close()

	var events []Event
	for rows.Next() {
		var event Event
		err := rows.Scan(&event.Id, &event.Category, &event.Subcategory, &event.Date, &event.StartTime, &event.EndTime, &event.Price, &event.NumberOfPersons, &event.Address, &event.Title, &event.Description, &event.PhotoUrls, &event.City, &event.Country, &event.MainPhotoUrl)
		if err != nil {
			log.Fatal(err)
		}
		events = append(events, event)
	}

	context.IndentedJSON(http.StatusOK, events)
}
func createEvent(context *gin.Context) {
	var event Event
	if err := context.BindJSON(&event); err != nil {
		panic(err)
	}

	sqlStatement := `INSERT INTO sportskillschema.events(
		category, subcategory, date, start_time, end_time, price, number_of_persons, address, title, description) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)`

	_, err := DB.Exec(sqlStatement, event.Category, event.Subcategory, event.Date, event.StartTime, event.EndTime, event.Price, event.NumberOfPersons, event.Address, event.Title, event.Description)

	if err != nil {
		panic(err)
	} else {
		context.IndentedJSON(http.StatusCreated, "event created successfully")
	}
}
func main() {
	//dbCredentials := getAWSSecrets()
	openDatabaseconnection()

	router := gin.Default()
	routes.AuthRoutes(router)
	routes.UserRoutes(router)
	router.GET("/category", getCategories)
	router.GET("/events", getEvents)
	router.POST("event", createEvent)
	router.Run(":5000")
}
