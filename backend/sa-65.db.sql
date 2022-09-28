BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "employees" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"password"	text,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "book_types" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"password"	text,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "shelves" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"password"	text,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "books" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"name"	text,
	"emp_id"	integer,
	"booktype_id"	integer,
	"shelf_id"	integer,
	"author"	text,
	"page"	integer,
	"quantity"	integer,
	"price"	integer,
	"date"	datetime,
	PRIMARY KEY("id"),
	CONSTRAINT "fk_book_types_books" FOREIGN KEY("booktype_id") REFERENCES "book_types"("id"),
	CONSTRAINT "fk_shelves_books" FOREIGN KEY("shelf_id") REFERENCES "shelves"("id"),
	CONSTRAINT "fk_employees_books" FOREIGN KEY("emp_id") REFERENCES "employees"("id")
);
CREATE INDEX IF NOT EXISTS "idx_employees_deleted_at" ON "employees" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_book_types_deleted_at" ON "book_types" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_shelves_deleted_at" ON "shelves" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_books_deleted_at" ON "books" (
	"deleted_at"
);
COMMIT;
