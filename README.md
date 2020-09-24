# WordPress template

This repository serves as a convenience for easily
setting up a containerized WordPress development environment (with Docker).

nginx is used as the web server, and MariaDB as the database.

# Usage

Clone this repository and delete `./git` directory.

Install wordpress core in this directory under `wordpress`.
If you have wp-cli installed:

`wp core download --path=wordpress`

Configure wordpress

`./wp-config.sh`

Start up services

`docker-compose up -d`.

The WordPress installation should now be available at `localhost:8080`.
