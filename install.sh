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

# Garante que o script principal existe e aplica permissão
if [ -f "$INSTALL_DIR/scanner.sh" ]; then
    chmod +x "$INSTALL_DIR/scanner.sh"
else
    echo "❌ Erro: scanner.sh não encontrado em $INSTALL_DIR"
    exit 1
fi

# Cria link simbólico para comando global no Termux
BIN_PATH="$PREFIX/bin/scanner"
rm -f "$BIN_PATH"
ln -s "$INSTALL_DIR/scanner.sh" "$BIN_PATH"

# Cria lista padrão
echo -e "google.com\nuol.com.br\nglobo.com" > "$INSTALL_DIR/lista.txt"
echo -e "📝 Criando lista.txt com domínios padrão..."

# Mensagem final
echo -e "\n✅ Instalado com sucesso em: $INSTALL_DIR"
echo "🖋️  Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: scanner"
