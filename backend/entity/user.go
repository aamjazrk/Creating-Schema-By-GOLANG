package entity

import (
	"time"

	"gorm.io/gorm"
)

type Employee struct {
	gorm.Model
	Name     string
	Password string
	// 1 emp ทีได้หลาย book
	Books []Book `gorm:"foreignKey:Emp_ID"`
}

type Book struct {
	gorm.Model
	Name string
	//ทำหน้าที่เป็น FK
	Emp_ID      *uint
	Booktype_ID *uint
	Shelf_ID    *uint
	//join ให้งายขึ้น
	Emp      Employee
	Booktype Book_type
	Shelf    Shelf
	Author   string
	Page     int
	Quantity int
	Price    int
	Date     time.Time
}

type Book_type struct {
	gorm.Model
	Name     string
	Password string
	//1 book type มีได้หลาย book
	Books []Book `gorm:"foreignKey:Booktype_ID"`
}

type Shelf struct {
	gorm.Model
	Name     string
	Password string
	//1 shelf มีได้หลาย book
	Books []Book `gorm:"foreignKey:Shelf_ID"`
}
