up:
	docker compose up
down:
	docker compose down
build:
	docker compose build
up_build:
	docker compose up --build

bash:
	docker exec -it $$(docker ps --filter name=web -q) bash
migrate:
	docker exec -it $$(docker ps --filter name=web -q) rake db:migrate
seed:
	docker exec -it $$(docker ps --filter name=web -q) rake db:seed
console:
	docker exec -it $$(docker ps --filter name=web -q) rails c
test:
	docker exec -it $$(docker ps --filter name=web -q) rspec
rubocop:
	docker exec -it $$(docker ps --filter name=web -q) rubocop
rubocop_auto_correct:
	docker exec -it $$(docker ps --filter name=web -q) rubocop -a
rubocop_auto_correct_all:
	docker exec -it $$(docker ps --filter name=web -q) rubocop -A

# Aliases

u: up
d: down
b: build
ub: up_build
bb: bash
m: migrate
s: seed
c: console
t: test
r: rubocop
ra: rubocop_auto_correct
raa: rubocop_auto_correct_all
