.PHONY: s c t setup app-setup db-setup migrate

default: s

s:
	@echo ">>>> Starting Appication <<<<"
	docker-compose up --build

c:
	@echo ">>>> Starting console <<<<"
	docker-compose run web rails c

t:
	@echo ">>>> Running specs <<<<"
	docker-compose run web rspec

setup: db-setup migrate

app-setup:
	@echo ">>>> Bootstrapping new Application <<<<"
	docker-compose run web rails new . -d postgresql --skip-yarn --skip-coffee --skip-test-unit
	@echo "---- Update database config accordingly!"
	@echo "---- Setup RSpec"

db-setup:
	@echo ">>>> Setting up database <<<<"
	docker-compose run web rails db:setup

migrate:
	@echo ">>>> Running database migrations <<<<"
	docker-compose run web rails db:migrate
