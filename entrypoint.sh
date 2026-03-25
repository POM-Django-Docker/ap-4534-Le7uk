#!/bin/sh

echo "Waiting for database..."
while ! python -c "import psycopg2; psycopg2.connect(host='$DB_HOST', port='$DB_PORT', dbname='$DB_NAME', user='$DB_USER', password='$DB_PASSWORD')" 2>/dev/null; do
    sleep 1
done

echo "Database is ready!"
python library/manage.py migrate
python library/manage.py runserver 0.0.0.0:8000