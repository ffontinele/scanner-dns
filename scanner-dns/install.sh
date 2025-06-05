#!/bin/bash

echo -e "\n📦 Instalando o ScannerDNS...\n"

# Caminho de instalação
INSTALL_DIR="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"

# Remove instalação anterior
if [ -d "$INSTALL_DIR" ]; then
  echo "🧹 Removendo instalação anterior..."
  rm -rf "$INSTALL_DIR"
fi

# Clona o repositório atualizado
git clone https://github.com/ffontinele/scanner-dns.git "$INSTALL_DIR"

# Dá permissão de execução
chmod +x "$INSTALL_DIR/scanner.sh"

# Cria o comando global "scanner"
if [[ ":$PATH:" == *":$PREFIX/bin:"* ]] || [ -d "$PREFIX/bin" ]; then
  ln -sf "$INSTALL_DIR/scanner.sh" "$PREFIX/bin/scanner"
else
  ln -sf "$INSTALL_DIR/scanner.sh" "/data/data/com.termux/files/usr/bin/scanner"
fi

# Cria o arquivo lista.txt se não existir, com domínios padrão
LISTA="$INSTALL_DIR/lista.txt"
if [ ! -f "$LISTA" ]; then
  echo -e "globo.com\nuol.com.br\ngoogle.com" > "$LISTA"
  echo "📝 Arquivo 'lista.txt' criado com domínios padrão."
fi

echo -e "\n✅ Instalado com sucesso em: $INSTALL_DIR"
echo "✏️  Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: scanner"
