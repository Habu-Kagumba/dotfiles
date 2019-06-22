.PHONY:  server cli test migrate

default: server

server:
	@echo ">>>> Starting Appication <<<<"
	docker-compose up --build

cli:
	@echo ">>>> Starting console <<<<"
	docker-compose run web rails c

test:
	@echo ">>>> Running specs <<<<"
	docker-compose run web rspec -fd

migrate:
	@echo ">>>> Running database migrations <<<<"
	docker-compose run web rails db:migrate
