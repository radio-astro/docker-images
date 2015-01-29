DOCKER_REPO=radioastro/meqtrees-nightly

.PHONY: docker-image clean

all: docker-image

docker-image:
		docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run: docker-image
	docker run ${DOCKER_REPO} /bin/bash
