KIBANA_HOST=localhost
KIBANA_PORT=5601
ELASTIC_USER=
ELASTIC_PASSWORD=

if [ -n "${ELASTIC_USER}" ]; then
  CURL_UESR_OPT="-u ${ELASTIC_USER}:${ELASTIC_PASSWORD}"
fi

curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-index.ndjson
curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-visualize.ndjson
curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-dashboard.ndjson
