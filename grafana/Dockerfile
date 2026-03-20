FROM grafana/grafana:12.1.1

USER root

RUN mkdir -p /var/lib/grafana/plugins && \
    chmod 777 /var/lib/grafana && \
    chmod 777 /var/lib/grafana/plugins

EXPOSE 3000

HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:3000/api/health || exit 1