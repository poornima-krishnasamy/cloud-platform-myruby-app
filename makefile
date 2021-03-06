IMAGE := poornimak/myrubyapp
VERSION := 1.1
KUBE_CONFIG := ~/.kube/config
AWS_PROFILE := moj-cp # Cloud Platform AWS account

build: .built-docker-image

.built-docker-image: Dockerfile Gemfile Gemfile.lock makefile
	docker build -t $(IMAGE) .
	touch .built-docker-image

push:
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSION)
	docker tag $(IMAGE) $(IMAGE):latest
	docker push $(IMAGE):latest

shell:
	docker run --rm -it \
		-v $(KUBE_CONFIG):/app/config \
		-v $${PWD}/spec:/app/spec \
		-v $${HOME}/.aws:/app/.aws \
		-e AWS_CONFIG_FILE=/app/.aws/config \
		-e AWS_PROFILE=$(AWS_PROFILE) \
		-e AWS_SHARED_CREDENTIALS_FILE=/app/.aws/credentials \
		-e KUBECONFIG=/app/config \
		$(IMAGE) sh