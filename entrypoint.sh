#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# If the database exists, migrate. Otherwise setup the database.
# rails db:prepare will create the database if it doesn't exist and run migrations.
bundle exec rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
