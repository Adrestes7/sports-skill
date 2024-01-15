package database

import (
	"sportsapp-back/models"
)

func FindUserProfile(user_id string) (models.Profile, error) {
	var profile models.Profile
	rows, err := DB.Query("select profile.id, profile.name, profile.last_name, profile.age, profile.address, profile.photo_path, profile.email, user_sports.sportsname, user_sports.usergrade, user_sports.feedback_grade, user_sports.number_of_persons from sportskillschema.profile as profile join sportskillschema.user_sports as user_sports on profile.id = user_sports.user_id where profile.id = $1", user_id)
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
