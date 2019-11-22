set KIBANA_HOST=localhost
set KIBANA_PORT=5601
set ELASTIC_USER=
set ELASTIC_PASSWORD=

if defined ELASTIC_USER (
  set CURL_UESR_OPT=-u %ELASTIC_USER%:%ELASTIC_PASSWORD%
)

curl %CURL_UESR_OPT% -X POST "http://%KIBANA_HOST%:%KIBANA_PORT%/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-index.ndjson
curl %CURL_UESR_OPT% -X POST "http://%KIBANA_HOST%:%KIBANA_PORT%/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-visualize.ndjson
curl %CURL_UESR_OPT% -X POST "http://%KIBANA_HOST%:%KIBANA_PORT%/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-dashboard.ndjson

