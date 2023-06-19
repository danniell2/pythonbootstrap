#!/bin/bash

if [ "$DATABASE" = "mysql" ]
then
    echo "Waiting for mysql..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done
    echo "MySQL started"
fi

# Remove comment to Clear entire database below - 2 next lines"
# echo "Clear entire database"
# python manage.py flush --no-input

echo "Appling database migrations..."
python manage.py makemigrations 
python manage.py migrate

exec "$@"
