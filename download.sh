#!/bin/bash

PASTA_DESTINO="$HOME/Documentos/ScannerDNS"
LISTA="$PASTA_DESTINO/lista.txt"

echo -e "\e[1;36m📥 Atualizando lista de domínios...\e[0m"

cat <<EOF > "$LISTA"
google.com
uol.com.br
globo.com
github.com
bing.com
yahoo.com
cloudflare.com
g1.globo.com
api.whatsapp.com
youtube.com
EOF

echo -e "\e[1;32m✅ Lista de domínios atualizada com sucesso!\e[0m"
echo -e "📝 Caminho: \e[1;33m$LISTA\e[0m"
