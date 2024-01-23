package models

import (
	"mime/multipart"
)

type CreateEvent struct {
	Event Event                   `form:"eventInfo"`
	Image []*multipart.FileHeader `form:"file"`
}
