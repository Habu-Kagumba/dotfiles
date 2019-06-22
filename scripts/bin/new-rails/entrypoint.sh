#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z db 5432; do
  sleep 0.1
done

echo "✓ PostgreSQL started"

echo "Setting up project..."
if [ ! -d app ]; then
    echo "➤ Create new project"
    rails new . -s -T -G -d postgresql --api --skip-test
    rm config/database.yml
    mv database.yml config/
    echo "➤ Run db:setup"
    rails db:setup
    rails db:migrate
    echo "➤ Setup Rspec"
    rails g rspec:install
fi

bundle exec puma -C config/puma.rb
