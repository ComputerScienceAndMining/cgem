# Include environment variables from .env
include .env

RDEBUG_CMD=bundle exec rdebug-ide
RAILS_CMD=bin/rails
RAKE_CMD=bin/rake

# Colors
GREEN=\033[0;32m
RED=\033[0;31m
NC=\033[0m # No Color

# If code is executed inside a container
ifneq ($(wildcard /.dockerenv),)
	DOCKER_HOST_IP := $(shell /sbin/ip route|awk '/default/ { print $$3 }')
else
	DOCKER_APP_CONTAINER_ID := $(shell docker ps --filter="name=$(APP_CONTAINER_NAME)" -q)
endif

init: create
#
clean_db:
	$(RAKE_CMD) db:drop:all RAILS_ENV=$(ENV);	# Drop DB
	$(RAKE_CMD) db:create RAILS_ENV=$(ENV);		# Create DB
	$(RAKE_CMD) db:migrate RAILS_ENV=$(ENV);		# Create DB tables and relations - Used for version control

# Models
scaffold_models:
	$(RAILS_CMD) g scaffold Organisation \
		name:string{255};

	$(RAILS_CMD) g scaffold User \
		first_name:string{255} \
		last_name:string{255} \
		enabled:boolean \
		role:integer{4};

	$(RAILS_CMD) g scaffold WorkOrderStatus \
		name:string{255};

	$(RAILS_CMD) g scaffold WorkOrder \
		name:string{255} \
		description:text \
		due_date:date \
		user:references \
		work_order_status:references \
		organisation:references;

	$(RAILS_CMD) g scaffold SampleType \
		name:string{255} \
		data:jsonb; # Attributes related to sample type

	$(RAILS_CMD) g scaffold SampleTypeVersion \
		sample_type:references \
		name:string{255} \
		data:jsonb; # Attributes related to sample type

	$(RAILS_CMD) g scaffold Sample \
		code:string{255} \
		remarks:text \
		sample_type:references \
		sample_type_version:references \
		work_order:references \
		data:jsonb; # Attributes related to sample type;

	$(RAILS_CMD) g scaffold SpecimenType \
		name:string{255} \
		data:jsonb;

	$(RAILS_CMD) g scaffold SpecimenTypeVersion \
		specimen_type:references \
		name:string{255} \
		data:jsonb;

	$(RAILS_CMD) g scaffold Specimen \
		code:string{255} \
		remarks:text \
		sample:references \
		specimen_type:references \
		specimen_type_version:references \
		user:references \
		data:jsonb;

	$(RAILS_CMD) g scaffold SpecimenGroup \
		work_order:references \
		name:string{255} \
		description:text;

	$(RAILS_CMD) g scaffold SpecimenGroupRelationship \
		specimen:references \
		specimen_group:references;

	$(RAILS_CMD) g scaffold TestType \
		name:string{255} \
		description:text \
		data:jsonb; # Attributes related to test type

	$(RAILS_CMD) g scaffold TestTypeVersion \
		name:string{255} \
		description:string{255} \
		data:jsonb \
		test_type:references;

	$(RAILS_CMD) g scaffold TestStatus \
		name:string{255};

	$(RAILS_CMD) g scaffold LabTest \
		started_at:timestamp \
		ended_at:timestamp \
		work_order:references \
		test_status:references \
		test_type:references \
		test_type_version:references \
		specimen:references \
		user:references \
		data:jsonb; # Attributes related to test with their results

	$(RAILS_CMD) g scaffold Picture \
		local_id:string{36} \
		sample:references \
		specimen:references \
		lab_test:references;

	$(RAILS_CMD) g scaffold Parameter \
		key:string{255} \
		value:string{255};

destroy_models:
	$(RAILS_CMD) d scaffold Organisation
	$(RAILS_CMD) d scaffold User
	$(RAILS_CMD) d scaffold WorkOrderStatus
	$(RAILS_CMD) d scaffold WorkOrder
	$(RAILS_CMD) d scaffold SampleType
	$(RAILS_CMD) d scaffold SampleTypeVersion
	$(RAILS_CMD) d scaffold Sample
	$(RAILS_CMD) d scaffold SpecimenType
	$(RAILS_CMD) d scaffold SpecimenTypeVersion
	$(RAILS_CMD) d scaffold Specimen
	$(RAILS_CMD) d scaffold SpecimenGroup
	$(RAILS_CMD) d scaffold SpecimenGroupRelationship
	$(RAILS_CMD) d scaffold TestType
	$(RAILS_CMD) d scaffold TestTypeVersion
	$(RAILS_CMD) d scaffold TestStatus
	$(RAILS_CMD) d scaffold LabTest
	$(RAILS_CMD) d scaffold Parameter

# Devise
enable_devise:
	$(RAILS_CMD) generate devise:install
	$(RAILS_CMD) generate devise User

disable_devise:
	$(RAILS_CMD) destroy devise:install
	$(RAILS_CMD) destroy devise User

# Policies
scaffold_policies:

	$(RAILS_CMD) g pundit:policy organisation
	$(RAILS_CMD) g pundit:policy user
	$(RAILS_CMD) g pundit:policy work_order_status
	$(RAILS_CMD) g pundit:policy work_order
	$(RAILS_CMD) g pundit:policy sample_type
	$(RAILS_CMD) g pundit:policy sample_type_version
	$(RAILS_CMD) g pundit:policy sample
	$(RAILS_CMD) g pundit:policy specimen_type
	$(RAILS_CMD) g pundit:policy specimen_type_version
	$(RAILS_CMD) g pundit:policy specimen
	$(RAILS_CMD) g pundit:policy specimen_group
	$(RAILS_CMD) g pundit:policy specimen_group_relationship
	$(RAILS_CMD) g pundit:policy test_type
	$(RAILS_CMD) g pundit:policy test_type_version
	$(RAILS_CMD) g pundit:policy test_status
	$(RAILS_CMD) g pundit:policy lab_test
	$(RAILS_CMD) g pundit:policy parameter

destroy_policies:
	$(RAILS_CMD) d pundit:policy organisation
	$(RAILS_CMD) d pundit:policy user
	$(RAILS_CMD) d pundit:policy work_order_status
	$(RAILS_CMD) d pundit:policy work_order
	$(RAILS_CMD) d pundit:policy sample_type
	$(RAILS_CMD) d pundit:policy sample_type_version
	$(RAILS_CMD) d pundit:policy sample
	$(RAILS_CMD) d pundit:policy specimen_type
	$(RAILS_CMD) d pundit:policy specimen_type_version
	$(RAILS_CMD) d pundit:policy specimen
	$(RAILS_CMD) d pundit:policy specimen_group
	$(RAILS_CMD) d pundit:policy specimen_group_relationship
	$(RAILS_CMD) d pundit:policy test_type
	$(RAILS_CMD) d pundit:policy test_type_version
	$(RAILS_CMD) d pundit:policy test_status
	$(RAILS_CMD) d pundit:policy lab_test
	$(RAILS_CMD) d pundit:policy parameter

# Database
create:
	# $(RAKE_CMD) db:schema:load;	# Load db schema (Delete and Create empty DB)
	# $(RAKE_CMD) db:drop:all;		# Drop DB
	$(RAKE_CMD) db:create;			# Create DB if doesn't exists
	$(RAKE_CMD) db:clear;			# Drop tables from environment related db
	$(RAKE_CMD) db:migrate;		# Create tables and relations - Used for version control

seed:
	$(RAKE_CMD) db:seed

scaffold: scaffold_models scaffold_policies enable_devise
destroy: disable_devise destroy_models destroy_policies
redo: destroy scaffold create seed

build:
ifeq ($(wildcard /.dockerenv),)
	docker-compose build
endif

run:
ifeq ($(wildcard /.dockerenv),)
	docker-compose up
endif

start:
ifeq ($(wildcard /.dockerenv),)
	docker-compose up -d
endif

stop:
ifeq ($(wildcard /.dockerenv),)
	docker-compose stop
endif

restart:
ifeq ($(wildcard /.dockerenv),)
	docker-compose restart
endif

enter:
	docker exec -it $(APP_CONTAINER_NAME) /bin/bash -l

enter-sidekiq:
	docker exec -it $(SIDEKIQ_CONTAINER_NAME) /bin/bash -l

enter-ops:
	docker exec -it $(OPS_CONTAINER_NAME) /bin/bash -l

status:
ifeq ($(wildcard /.dockerenv),)
ifeq ($(DOCKER_APP_CONTAINER_ID),)
	@echo "$(RED)APP container is not running$(NC)"
else
	@echo "$(GREEN)APP container is running$(NC)"
endif
endif

s: server
server: start
ifeq ($(wildcard /.dockerenv),)
	docker exec -it $(APP_CONTAINER_NAME) /bin/bash -l -c "make server";
else
	TRUSTED_IP=$(DOCKER_HOST_IP) RAILS_ENV=$(ENV) $(RAILS_CMD) s -b 0.0.0.0 -p 3000
endif

sq: sidekiq
sidekiq: start
ifeq ($(wildcard /.dockerenv),)
	docker exec -it $(APP_CONTAINER_NAME) /bin/bash -l -c "make sidekiq";
else
	TRUSTED_IP=$(DOCKER_HOST_IP) RAILS_ENV=$(ENV) bundle exec sidekiq -e $(ENV) -c $(SIDEKIQ_CONCURRENCY)
endif

c: console
console: start
ifeq ($(wildcard /.dockerenv),)
	docker exec -it $(APP_CONTAINER_NAME) /bin/bash -l -c "make console";
else
	TRUSTED_IP=$(DOCKER_HOST_IP) RAILS_ENV=$(ENV) $(RAILS_CMD) c
endif

d:debug
debug: start
ifeq ($(wildcard /.dockerenv),)
	docker exec -it $(APP_CONTAINER_NAME) /bin/bash -l -c "make debug";
else
	TRUSTED_IP=$(DOCKER_HOST_IP) RAILS_ENV=$(ENV) $(RDEBUG_CMD) --host 0.0.0.0 --port 3001 -- $(RAILS_CMD) s -b 0.0.0.0 -p 3000
endif