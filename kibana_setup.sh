KIBANA_HOST=192.168.0.11
KIBANA_PORT=5601
KIBANA_USER=
KIBANA_PASSWORD=

if [ -n "${KIBANA_USER}" ]; then
  CURL_UESR_OPT="-u ${KIBANA_USER}:${KIBANA_PASSWORD}"
fi

curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-index.ndjson
curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-visualize.ndjson
curl ${CURL_UESR_OPT} -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-dashboard.ndjson
