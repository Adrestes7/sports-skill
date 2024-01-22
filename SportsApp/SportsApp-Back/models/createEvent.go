package models

import (
	"mime/multipart"
)

type CreateEvent struct {
	Image []*multipart.FileHeader `form:"file"`
	Event Event                   `form:"eventInfo"`
}
