REPO := thombashi/spanner-schema-diff
VERSION := 2e77d45

.PHONY: docker-build
docker-build:
	docker build -t $(REPO):$(VERSION) --pull . --build-arg REF=$(VERSION)
