#!/bin/bash

echo -e "📦 Instalando o ScannerDNS...\n"

# Caminho base no Termux
DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"

echo -e "🧹 Removendo instalação anterior..."
rm -rf "$DEST"
rm -f "$PREFIX/bin/scanner"

# Clonar projeto
git clone https://github.com/ffontinele/scanner-dns.git "$DEST"

# Garantir permissões de execução
chmod +x "$DEST/scanner.sh"

# Criar atalho global
ln -sf "$DEST/scanner.sh" "$PREFIX/bin/scanner"

# Criar lista de domínios se não existir
LISTA="$DEST/lista.txt"
if [ ! -f "$LISTA" ]; then
  echo -e "📝 Criando lista.txt com domínios padrão..."
  echo -e "google.com\nuol.com.br\nglobo.com" > "$LISTA"
fi

echo -e "\n✅ Instalado com sucesso em: $DEST"
echo -e "✏️  Edite o arquivo 'lista.txt' com seus domínios."
echo -e "👉 Execute com: scanner"

GitHub (https://github.com/ffontinele/scanner-dns.git)
ffontinele/scanner-dns
escript para escanear domínios e gerar payloads automáticas (SNI, HTTP) - ffontinele/scanner-dns
