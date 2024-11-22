.PHONY: run migration_create 

run: 
	go run cmd/main.go

## using golang-migrate
migration_create:
	migrate create -ext sql -dir internal/infrastructure/migrations/ -seq table_schema

migration_up:
	migrate -path internal/infrastructure/migrations/ -database "postgresql://postgres:12345@localhost:5432/instagram_db?sslmode=disable" -verbose up

migration_force:
	migrate -path internal/infrastructure/migrations/ -database "postgresql://postgres:12345@localhost:5432/instagram_db?sslmode=disable" force 1
