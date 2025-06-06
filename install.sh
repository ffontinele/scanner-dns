#!/bin/bash

# Caminho da pasta de destino
PASTA_DESTINO="$HOME/Documentos/ScannerDNS"

# Caminho do atalho global
ATALHO="/data/data/com.termux/files/usr/bin/scanner"
[[ ! -d "/data/data" ]] && ATALHO="/usr/local/bin/scanner"

# Mensagem de boas-vindas
echo -e "\e[1;32m🛠️ Iniciando a instalação do ScannerDNS...\e[0m"

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

# Verificar se o script principal foi baixado
if [[ ! -s "$PASTA_DESTINO/.scanner.sh" ]]; then
    echo -e "\e[1;31m❌ Falha ao baixar o arquivo .scanner.sh. Verifique sua conexão.\e[0m"
    exit 1
fi

# Criar lista.txt com domínios padrão
cat <<EOF > "$PASTA_DESTINO/lista.txt"
google.com
uol.com.br
globo.com
EOF

# Garantir permissões
chmod +x "$PASTA_DESTINO/.scanner.sh"

# Criar o comando global 'scanner'
echo -e "#!/bin/bash\nbash \"$PASTA_DESTINO/.scanner.sh\"" > "$ATALHO"
chmod +x "$ATALHO"

echo -e "\e[1;32m✅ Instalação concluída com sucesso!\e[0m"
echo -e "\e[1;36m📁 Diretório de instalação: $PASTA_DESTINO"
echo -e "\e[1;36m🚀 Para iniciar, digite: \e[1;33mscanner\e[0m"
