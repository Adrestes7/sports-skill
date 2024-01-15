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
