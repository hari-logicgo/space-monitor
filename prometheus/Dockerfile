FROM prom/prometheus:v3.2.1

COPY --chmod=755 start-prometheus.sh /usr/local/bin/start-prometheus.sh
COPY prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

ENTRYPOINT ["/usr/local/bin/start-prometheus.sh"]