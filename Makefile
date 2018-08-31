all: build push
test: build pushtest

build:
	docker build -t demilletech/concourse-kubernetes-resource:local .

push:
	docker tag demilletech/concourse-kubernetes-resource:local demilletech/concourse-kubernetes-resource:latest
	docker push demilletech/concourse-kubernetes-resource:latest

pushtest:
	docker tag demilletech/concourse-kubernetes-resource:local demilletech/concourse-kubernetes-resource:test
	docker push demilletech/concourse-kubernetes-resource:test
