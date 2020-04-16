# Top section copied from http://clarkgrubb.com/makefile-style-guide
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.DEFAULT_GOAL := start
.DELETE_ON_ERROR:
.SUFFIXES:

#-----------------------------------------------------------------------------------------
# SECTION: VARS
ES_HOST := localhost
ES_PORT := 9200
CAT := curl -H "Content-Type: application/json" http://${ES_HOST}:${ES_PORT}

#-----------------------------------------------------------------------------------------
# SECTION: ELASTIC QUERIES

# make LOC='indices' list
# make LOC='indices/kibana_sample_data_flights' list
# make
list:
	${CAT}/${LOC}

# make IND='kibana_sample_data_flights' DATA='{OriginCountry:DE,OriginCityName:Munich}' search
search:
	${CAT}/${IND}/_search?q=${DATA} -s | jq

#-----------------------------------------------------------------------------------------
# SECTION: EXAMPLE QUERIES
example-queries:
	# Flights to Australia
	$(MAKE) IND='kibana_sample_data_flights' DATA='{OriginCountry:DE,OriginCityName:Munich,DestCityName:Lima}' search

