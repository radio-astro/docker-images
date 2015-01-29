DOCKER_REPO=radioastro/notebook

.PHONY: docker-image clean

all: docker-image

docker-image:
		docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run:
	docker run -itP \
		-v $(realpath notebooks):/notebooks:rw \
		-v $(realpath data):/data:ro \
		${DOCKER_REPO}
