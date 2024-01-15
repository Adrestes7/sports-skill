package database

import (
	"context"
	"database/sql"
	"log"
	"sportsapp-back/models"
)

func FindUserProfile(ctx context.Context, user_id string) (models.Profile, error) {
	var profile models.Profile
	rows, err := DB.QueryContext(ctx, "select profile.id, profile.name, profile.lastname, profile.age, profile.address, profile.photopath, profile.email, user_sports.sportsname, user_sports.usergrade, user_sports.feedback_grade, user_sports.number_of_persons from sportskillschema.profile as profile join sportskillschema.user_sports as user_sports on profile.id = user_sports.user_id where profile.id = $1", user_id)
	if err != nil {
		return profile, err
	}
	defer rows.Close()

	for rows.Next() {
		var sport models.UserSports
		err := rows.Scan(&profile.Id, &profile.Name, &profile.LastName, &profile.Age, &profile.Address, &profile.PhotoPath, &profile.Email, &sport.SportName, &sport.UserGrade, &sport.FeedbackGrade, &sport.NumberOfPersons)
		if err != nil {
			return profile, err
		}
		profile.Sports = append(profile.Sports, sport)
	}
	return profile, nil
}

func CreateUser(ctx context.Context, user models.UserModel) error {
	sqlStatement := `INSERT INTO sportskillschema.users(
		id, first_name, last_name, password, email, phone, token, user_type, refreshtoken, created_at, updated_at, user_id)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);`

	_, err := DB.ExecContext(ctx, sqlStatement, user.Id, user.FirstName, user.LastName, user.Password, user.Email, user.Phone, user.Token, user.UserType, user.RefreshToken, user.CreatedAt, user.UpdatedAt, user.User_id)
	return err
}

func FindUserByEmail(ctx context.Context, email string) (user models.UserModel, err error) {
	var userFinded models.UserModel
	if err := DB.QueryRowContext(ctx, "select * from sportskillschema.users where email = $1", email).Scan(&userFinded.Id, &userFinded.FirstName, &userFinded.LastName, &userFinded.Password, &userFinded.Email, &userFinded.Phone, &userFinded.Token, &userFinded.UserType, &userFinded.RefreshToken, &userFinded.CreatedAt, &userFinded.UpdatedAt, &userFinded.User_id); err != nil {
		if err == sql.ErrNoRows {
			log.Panic("No user with that email")
			return userFinded, err
		}
		log.Panic(err)
		return userFinded, err
	}
	return userFinded, err
}
func FindUserById(ctx context.Context, user_id string) (userFound models.UserModel, err error) {
	var userFinded models.UserModel
	if err := DB.QueryRowContext(ctx, "select * from sportskillschema.users where user_id = $1", user_id).Scan(&userFinded.Id, &userFinded.FirstName, &userFinded.LastName, &userFinded.Password, &userFinded.Email, &userFinded.Phone, &userFinded.Token, &userFinded.UserType, &userFinded.RefreshToken, &userFinded.CreatedAt, &userFinded.UpdatedAt, &userFinded.User_id); err != nil {
		if err == sql.ErrNoRows {
			log.Panic("No user with that user_id")
			return userFinded, err
		}
		log.Panic(err)
		return userFinded, err
	}
	return userFinded, err
}

func UpdateUserTokens(ctx context.Context, user models.UserModel) error {

	sqlStatement := `UPDATE sportskillschema.users set token = $1, refreshtoken = $2, updated_at = $3 where id = $4`

	_, err := DB.ExecContext(ctx, sqlStatement, user.Token, user.RefreshToken, user.UpdatedAt, user.Id)

	return err
}
