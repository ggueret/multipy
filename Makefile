build:
	docker build . -t ggueret/multipy

push:
	docker push ggueret/multipy

run:
	docker run -ti ggueret/multipy bash
