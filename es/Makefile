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
CAT := curl -v -H "Content-Type: application/json" http://${ES_HOST}:${ES_PORT}
POST := curl -v -X POST -H "Content-Type: application/json" http://${ES_HOST}:${ES_PORT}

#-----------------------------------------------------------------------------------------
# SECTION: ELASTIC QUERIES

# make LOC='indices' list
# make LOC='indices/kibana_sample_data_flights' list
# make
list:
	${CAT}/${LOC}

# make INDEX='kibana_sample_data_flights' QUERY='{OriginCityName:Munich,DestCityName:Lima}' search
search:
	${POST}/${INDEX}/_search -d ${QUERY} -s | jq


