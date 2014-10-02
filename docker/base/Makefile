DOCKER_REPO=gijzelaerr/papino

.PHONY: docker-image clean

all: docker-image

docker-image:
		docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}
