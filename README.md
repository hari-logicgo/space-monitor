# Railway Monitoring Deploy

This repo is set up for Railway as two separate services:

- `prometheus/`
- `grafana/`

## Local use

Set `HF_TOKEN` in your shell, then run:

```powershell
$env:HF_TOKEN="your_token"
docker compose up --build
```

Grafana will be on `http://localhost:3001` and Prometheus on `http://localhost:9090`.

## Railway deploy

1. Push this folder to a GitHub repository.
2. In Railway, create a new project from that repo.
3. Add a `prometheus` service and set:
   - Root Directory: `prometheus`
   - Port: `9090`
   - Variable: `HF_TOKEN=<your Hugging Face token>`
4. Add a `grafana` service and set:
   - Root Directory: `grafana`
   - Port: `3000`
   - Variables:
     - `GF_SECURITY_ADMIN_USER=<your admin username>`
     - `GF_SECURITY_ADMIN_PASSWORD=<strong password>`
5. Optional but recommended:
   - Add a persistent volume to Prometheus mounted at `/prometheus`
   - Add a persistent volume to Grafana mounted at `/var/lib/grafana`
6. In Grafana, add Prometheus as a data source using:
   - `http://prometheus.railway.internal:9090`

If Railway assigns different service names, use that exact service name in the internal hostname:

`http://<service-name>.railway.internal:9090`
