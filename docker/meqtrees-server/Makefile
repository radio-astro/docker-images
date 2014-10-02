DOCKER_REPO=gijzelaerr/papino-meqtrees-server

.PHONY: docker-image clean

all: docker-image

docker-image:
		docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run: docker-image
	docker run -v $(realpath ../../notebooks):/notebooks:rw -v $(realpath ../../data):/data/:ro -P ${DOCKER_REPO}
