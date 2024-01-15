package database

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

var DB *sql.DB = DBinstance()

func DBinstance() *sql.DB {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=require",
		"sports-skill.czke2wiuefcl.us-east-1.rds.amazonaws.com", 5432, "sportsSkillDB", "43H)<gGgTd#j:[G8UQME6$I4M3rD", "SportsSkill")

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully connected!")
	return db
}

/*func getAWSSecrets() Credentials {
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
}*/
