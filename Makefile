all: build


.PHONY: build build-image


build: build-image
	docker run -it --rm --privileged moul/snappy-builder


build-image:
	docker build -t moul/snappy-builder .


publish: build-image
	docker push moul/snappy-builder
