package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()
	e.GET("/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, "hello docker")
	})
	e.Logger.Fatal(e.Start("0.0.0.0:8080"))
}
