#!/bin/bash
set -e

DBNAME="database"
FILENAME="/home/database.sql"

mysqldump -u root $DBNAME > $FILENAME