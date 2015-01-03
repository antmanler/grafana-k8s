
TAG = latest

build:
	docker build --force-rm -t d.rest/grafana-k8s:${TAG} .

push:
	docker push d.rest/grafana-k8s:$(TAG)

.PHONY: build push
