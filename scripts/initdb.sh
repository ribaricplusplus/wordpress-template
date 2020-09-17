#!/bin/bash

mysql --user=root --password=root --host=localhost --socket=/var/run/mysqld/mysqld.sock <<EOF
CREATE DATABASE wordpress;
EOF
