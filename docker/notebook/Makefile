DOCKER_REPO=radioastro/notebook

.PHONY: docker-image clean

all: docker-image

docker-image:
		docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run:
	docker run -P ${DOCKER_REPO}

run-connected: docker-image
	docker run -v $(realpath ../../notebooks):/notebooks:rw -v $(realpath ../../data):/data/:ro -P ${DOCKER_REPO}
