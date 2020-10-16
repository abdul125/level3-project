NAME = weaveworksdemos/catalogue
DBNAME = weaveworksdemos/catalogue-db

run:
	docker network create cate
	docker run --name vault \
		-it -d \
		--network cate \
		--cap-add=IPC_LOCK \
		-p 80:80 \
		abdul125/catalogue
	docker run -d \
		--name cate-db  \
		--network cate \
		cdb



TAG=$(TRAVIS_COMMIT)

INSTANCE = catalogue

.PHONY: default copy test

default: test

release:
	docker build -t $(NAME) -f ./docker/catalogue/Dockerfile .

test: 
	GROUP=weaveworksdemos COMMIT=test ./scripts/build.sh
	./test/test.sh unit.py
	./test/test.sh container.py --tag $(TAG)

dockertravisbuild: build
	docker build -t $(NAME):$(TAG) -f docker/catalogue/Dockerfile-release docker/catalogue/
	docker build -t $(DBNAME):$(TAG) -f docker/catalogue-db/Dockerfile docker/catalogue-db/
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)
	scripts/push.sh
