#!/bin/bash

set -ex

until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USERNAME"; do
  echo "⏳ Waiting for PostgreSQL to be ready..."
  sleep 2
done

echo "✅ PostgreSQL ready. Running migrations..."
php artisan migrate --force

php artisan create:default-admin
