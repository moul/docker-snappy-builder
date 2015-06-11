all: build


.PHONY: build build-image


build: build-image device.tar.xz snappy.img
	docker run \
	  -it --rm --privileged \
	  -v $(PWD)/device.tar.xz:/device.tar.xz \
	  -v $(PWD)/snappy.img:/snappy.img \
	  -v $(PWD)/dist:/dist \
	  moul/snappy-builder


build-image:
	docker build -t moul/snappy-builder .


publish: build-image
	docker push moul/snappy-builder


shell: build-image device.tar.xz snappy.img
	docker run \
	  -it --rm --privileged \
	  -v $(PWD)/device.tar.xz:/device.tar.xz \
	  -v $(PWD)/snappy.img:/snappy.img \
	  -v $(PWD)/dist:/dist \
	  moul/snappy-builder bash


snappy.img device.tar.xz:
	@echo "You should put a $@ for your hardware"
	@exit 1


dist:
	mkdir -p $@
