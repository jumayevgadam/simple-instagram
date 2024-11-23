// config package keeps needed configurations for this project.
// we write options and parameters in .env file

package config

// Config struct takes needed technologies for this project.
type Config struct {
	Server struct {
	}
	Postgres PostgresDB
}

// PostgresDB options for using psqlDB.
type PostgresDB struct {
}
