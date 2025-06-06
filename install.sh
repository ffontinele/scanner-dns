#!/bin/bash

# Caminho da pasta de destino
PASTA_DESTINO="$HOME/Documentos/ScannerDNS"

# Atalho global
ATALHO="/data/data/com.termux/files/usr/bin/scanner"
[[ ! -d "/data/data" ]] && ATALHO="/usr/local/bin/scanner"

# Mensagem de boas-vindas
echo -e "\e[1;32m🛠 Iniciando a instalação do ScannerDNS...\e[0m"

# Remover a pasta se já existir
if [ -d "$PASTA_DESTINO" ]; then
    echo -e "\e[1;33m⚠️ Pasta existente encontrada. Removendo...\e[0m"
    rm -rf "$PASTA_DESTINO"
fi

# Criar a nova pasta
mkdir -p "$PASTA_DESTINO"

# Baixar os arquivos principais
echo -e "\e[1;34m⬇️ Baixando arquivos do projeto...\e[0m"
wget -qO "$PASTA_DESTINO/.scanner.sh" https://raw.githubusercontent.com/ffontinele/scanner-dns/main/scanner-dns/.scanner.sh
wget -qO "$PASTA_DESTINO/download.sh" https://raw.githubusercontent.com/ffontinele/scanner-dns/main/scanner-dns/download.sh
