DOCKER_REPO=radioastro/purify

.PHONY: build clean run

all: build run

build:
	docker build --pull -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run: build
	docker run ${DOCKER_REPO}
