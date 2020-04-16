# elastic_kibana
In this repo we docker compose compose 2 containers:
 1. elasticsearch  
 2. kibana
 
 We then test-drive the elastic-kibana setup.
 
 ## Test drive
 ```bash
make start
make ping-es
make example-queries
make stop
 ```

## Example Query
The elasticsearch docker image comes pre-loaded with some flight data, which we query.
We submit the following simple lucene query for flights `from Munich to Sydney`:
```yaml
{
  "query": {
    "bool": {
      "must": [
        {"match": {"OriginCityName": "Munich"}},
        {"match": {"DestCityName": "Sydney"}}
      ]
    }
  }
}
```

## To-do
- [ ] Query city pairs in kibana
- [ ] Build kibana visualization of flights

## References
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
https://www.elastic.co/guide/en/elasticsearch/reference/current/search-request-body.html
[Docker compose networking](https://docs.docker.com/compose/networking/)

