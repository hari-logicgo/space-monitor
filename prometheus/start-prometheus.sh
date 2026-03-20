#!/bin/sh
set -eu

mkdir -p /etc/prometheus/secrets

if [ -z "${HF_TOKEN:-}" ]; then
  echo "HF_TOKEN is required" >&2
  exit 1
fi

printf "%s" "$HF_TOKEN" > /etc/prometheus/secrets/hf_token
chmod 600 /etc/prometheus/secrets/hf_token

exec /bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/tmp/prometheus \
  --web.listen-address=0.0.0.0:9090