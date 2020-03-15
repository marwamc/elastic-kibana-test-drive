# Top section copied from http://clarkgrubb.com/makefile-style-guide
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.DEFAULT_GOAL := start
.DELETE_ON_ERROR:
.SUFFIXES:

# VARS
docker_run := docker run -itd --rm


# TARGETS
network-start:
	docker network create --label name:esk_network esk_network

network-show:
	docker network list

network-prune: network-show
	docker network prune --force

build-es:
	cd es && docker build --tag elasticsearch .

build-kibana:
	cd kibana && docker build --tag kibana .

elasticsearch: build-es
	$(docker_run) --name elasticsearch --network=esk_network -p 9200:9200 es:latest

kibana: build-kibana
	$(docker_run) --name kibana --network=esk_network -p 5601:5601 kibana:latest

ping-es:
	curl -X GET "localhost:9200/_cat/nodes?v&pretty"

start:
	$(MAKE) network-prune
	$(MAKE) network-start
	$(MAKE) network-show
	$(MAKE) es
	$(MAKE) kibana

stop:
	docker stop kibana
	docker stop elasticsearch
	$(MAKE) network-prune
