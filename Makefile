default: build

build:
	docker build -t leucos/phpfpm-53 .

build-nocache:
	docker build --no-cache -t leucos/phpfpm-53 .

push:
	docker push leucos/phpfpm-53
