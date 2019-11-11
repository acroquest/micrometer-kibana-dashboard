export KIBANA_HOST=localhost
export KIBANA_PORT=5601

curl -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-index.ndjson
curl -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-visualize.ndjson
curl -X POST "http://${KIBANA_HOST}:${KIBANA_PORT}/api/saved_objects/_import" -H "kbn-xsrf: true" --form file=@kibana-dashboard.ndjson
