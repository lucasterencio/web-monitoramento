#!/usr/bin/env bash

setup() {
    directories=(
	prometheus
	grafana
	pgdata
    )

    for i in "${directories[@]}"; do
	if [[ ! -d $i ]]; then
	    mkdir $i
	    chmod -R 777 $i
	fi
    done
}

usage() {
    echo "Uso: ./run.sh [OPÇÃO]"
    echo ""
    echo "Opções:"
    echo "  -h, --help    Exibe esta mensagem de ajuda"
    echo "  -s, --start   Cria diretórios necessários e sobe os containers (docker compose up -d)"
    echo "  -t, --stop    Para e remove os containers (docker compose down)"
}

case $1 in
    -h|--help)
	usage
	;;
    -s|--start)
	setup && docker compose up -d
	;;
    -t|--stop)
	docker compose down
	;;
    *)
	usage
	;;
esac
