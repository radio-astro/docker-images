DOCKER_REPO=radioastro/iipsrv-astro

.PHONY: build clean run

all: build run

build:
	docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run: build
	docker run -tiP \
		-v $(realpath images):/images:ro \
		${DOCKER_REPO}
