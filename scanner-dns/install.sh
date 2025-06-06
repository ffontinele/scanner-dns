#!/bin/bash

echo -e "\n🛠️  Instalando o ScannerDNS...\n"

# Caminho de instalação
INSTALL_DIR="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"

# Remove a instalação anterior (se existir)
echo "🧹  Removendo instalação anterior..."
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Clona o repositório
git clone https://github.com/ffontinele/scanner-dns "$INSTALL_DIR"

# Dá permissão de execução
chmod +x "$INSTALL_DIR/scanner.sh"

# Cria link simbólico para execução direta (atalho 'scanner')
BIN_PATH="$PREFIX/bin/scanner"
rm -f "$BIN_PATH"
ln -s "$INSTALL_DIR/scanner.sh" "$BIN_PATH"

# Gera arquivo lista.txt com domínios padrão
echo -e "google.com\nuol.com.br\nglobo.com" > "$INSTALL_DIR/lista.txt"
echo -e "📝 Arquivo 'lista.txt' criado com domínios padrão."

echo -e "\n✅ Instalado com sucesso em: $INSTALL_DIR"
echo "🖋️  Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: scanner"
