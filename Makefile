.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#######################################
# Docker targets
#######################################
.PHONY: dckr-image
dckr-image:	## Builds the Docker image for building, developing and testing
	docker-compose build --pull 4c-project

.PHONY: dckr-shell
dckr-shell:	## Spawns a `bash` shell within a Docker container
	docker-compose run --rm 4c-project shell

#######################################
# Compilation targets
#######################################
.PHONY: dckr-build
dckr-build:	## Builds application and tests executables, within a Docker container
	docker-compose run --rm 4c-project build

.PHONY: build
build:		## Builds application and tests executables
	./scripts/entrypoint.sh build

#######################################
# Tests targets
#######################################
.PHONY: dckr-test
dckr-test:	## Run application tests, within a Docker container
	docker-compose run --rm 4c-project test

.PHONY: test
test:		## Run application tests
	./scripts/entrypoint.sh test

.PHONY: run
run:		## Run application tests
	./scripts/entrypoint.sh run
#######################################
# Utils targets
#######################################
.PHONY: dckr-format
dckr-format:## Formats C++ code using clang-format (with Webkit style, by default), within a Docker container
	docker-compose run --rm 4c-project format

.PHONY: format
format:		## Formats C++ code using clang-format (with Webkit style, by default)
	./scripts/entrypoint.sh format

#######################################
# Clean-up targets
#######################################
.PHONY: dckr-clean
dckr-clean:	## Removes building artifacts, within a Docker container
	docker-compose run --rm 4c-project clean

.PHONY: clean
clean:		## Removes building artifacts
	./scripts/entrypoint.sh clean

.PHONY: mrproper
mrproper: clean ## Removes building artifacts and downloaded libraries
	rm -rf build .conan
