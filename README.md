# Web Monitoramento

Demo de monitoramento de infraestrutura com Docker, Nginx, PostgreSQL, Prometheus e Grafana.

## Pré-requisitos

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/) (plugin `docker compose`)

## Configuração

Crie o arquivo `.env` na raiz do projeto:

```env
POSTGRES_USER=app
POSTGRES_PASSWORD=app123
POSTGRES_DB=exampledb
DATA_SOURCE_NAME=postgresql://app:app123@postgres:5432/exampledb?sslmode=disable
GF_SECURITY_ADMIN_USER=admin
GF_SECURITY_ADMIN_PASSWORD=admin
```

> O `.env` está no `.gitignore` e precisa ser criado manualmente antes de subir os containers.

## Como rodar

### Subir o projeto

```bash
./run.sh --start
```

Isso criará os diretórios necessários (`prometheus/`, `grafana/`, `pgdata/`) e iniciará todos os containers em segundo plano.

### Parar o projeto

```bash
./run.sh --stop
```

### Ver status dos containers

```bash
./run.sh --monitoring
```

## Acessos

| Serviço | URL |
|---|---|
| **Grafana** | http://localhost |
| **API** | http://localhost/application |
| **Nginx stub status** | http://localhost/stub_status |

> Login do Grafana: usuário e senha definidos no `.env` (`GF_SECURITY_ADMIN_USER` / `GF_SECURITY_ADMIN_PASSWORD`).

## Serviços

| Container | Descrição |
|---|---|
| `proxy` | Nginx — proxy reverso |
| `postgres` | PostgreSQL 16 |
| `app1` / `app2` | API de exemplo (2 réplicas) |
| `prometheus` | Coleta de métricas |
| `grafana` | Dashboards de monitoramento |
| `nginxex` | Exportador de métricas do Nginx |
| `postgresex` | Exportador de métricas do PostgreSQL |

O dashboard **Infra Monitoring** é provisionado automaticamente no Grafana e exibe métricas de conexões, requisições, latência, erros, banco de dados e cache.
