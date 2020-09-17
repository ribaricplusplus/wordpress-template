# WordPress template

This repository serves as a convenience for easily
setting up a containerized WordPress development environment (with Docker).

nginx is used as the web server, and MariaDB as the database.

# Usage

Clone this repository and delete `./git` directory.

Install wordpress core in this directory under `wordpress`.

Edit `wp-config.php`:
- DB name: `wordpress`
- DB user: `root`
- DB password: `root`
- Host: `db:3306`

Start up services: `docker-compose up -d`.

Configure MariaDB: `docker-compose exec db /initdb.sh`.

The WordPress installation should now be available at `localhost:8080`.
