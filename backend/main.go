package main

import (
	"github.com/aamjazrk/week5/entity"

	"github.com/gin-gonic/gin"
)

func main() {

	entity.SetupDatabase()

	r := gin.Default()

	r.Run()

}
