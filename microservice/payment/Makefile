NAME = abdul125/payment
INSTANCE = payment

.PHONY: default copy test

build:
	docker build -t abdul125/payment .

run:
	docker run -it -d --rm -p 8081:80 abdul125/payment

copy:
	docker create --name $(INSTANCE) $(NAME)-dev
	docker cp $(INSTANCE):/app/main $(shell pwd)/app
	docker rm $(INSTANCE)

release:
	docker build -t $(NAME) -f ./docker/payment/Dockerfile-release .
