default: build

build:
	docker build -t leucos/phpfpm-53 .

push:
	docker push leucos/phpfpm-53
