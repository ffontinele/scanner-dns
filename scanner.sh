#!/bin/bash

PASTA_DESTINO="$HOME/Documentos/ScannerDNS"
ATALHO="/data/data/com.termux/files/usr/bin/scanner"
[[ ! -d "/data/data" ]] && ATALHO="/usr/local/bin/scanner"

echo -e "\e[1;32m🛠 Iniciando a instalação do ScannerDNS...\e[0m"

if [ -d "$PASTA_DESTINO" ]; then
    echo -e "\e[1;33m⚠️ Pasta existente encontrada. Removendo...\e[0m"
    rm -rf "$PASTA_DESTINO"
fi

mkdir -p "$PASTA_DESTINO"

echo -e "\e[1;34m⬇️ Baixando arquivos do projeto...\e[0m"

curl -sSL "https://raw.githubusercontent.com/ffontinele/scanner-dns/main/.scanner.sh" -o "$PASTA_DESTINO/.scanner.sh"
curl -sSL "https://raw.githubusercontent.com/ffontinele/scanner-dns/main/download.sh" -o "$PASTA_DESTINO/download.sh"

if [[ ! -s "$PASTA_DESTINO/.scanner.sh" || ! -s "$PASTA_DESTINO/download.sh" ]]; then
    echo -e "\e[1;31m❌ Falha ao baixar os arquivos. Verifique sua conexão com a internet.\e[0m"
    exit 1
fi

chmod +x "$PASTA_DESTINO/.scanner.sh"
chmod +x "$PASTA_DESTINO/download.sh"

echo -e "google.com\nuol.com.br\nglobo.com" > "$PASTA_DESTINO/lista.txt"

echo -e "#!/bin/bash\nbash \"$PASTA_DESTINO/.scanner.sh\"" > "$ATALHO"
chmod +x "$ATALHO"

echo -e "\e[1;32m✅ Instalação concluída com sucesso!\e[0m"
echo -e "\e[1;36mPara iniciar, digite: \e[1;33mscanner\e[0m"
