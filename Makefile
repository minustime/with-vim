.PHONY: all help code build push run

TAG = minustime/workspace:ubuntu-bionic
WORKSPACE ?= workspace

all: help 
help:
	@echo "\nUsage: \n\n\
	make build               Build the container \n\
	make code                Run container, mount workspace directory and enter it \n\
	make push                Push container to Docker Hub \n\
	make run                 Enter the running container \n"

code: build
	@docker run -it -v `pwd`/${WORKSPACE}:/opt/workspace ${TAG}
build:
	@docker build -t ${TAG} .
push:
	@docker push -t ${TAG}
run: 
	@docker run -it ${TAG} 