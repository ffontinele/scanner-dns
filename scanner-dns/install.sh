#!/bin/bash

echo -e "\n📥 Instalando ScannerDNS..."

# Caminho para instalar
INSTALL_DIR="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"

# Remove pasta antiga se existir
if [ -d "$INSTALL_DIR" ]; then
    echo "🧹 Removendo versão anterior..."
    rm -rf "$INSTALL_DIR"
fi

# Clona novamente o repositório
git clone https://github.com/ffontinele/scanner-dns.git "$INSTALL_DIR"

# Dá permissão aos arquivos dentro da subpasta scanner-dns/
chmod +x "$INSTALL_DIR/scanner-dns/scanner.sh"

# Copia o script principal e a lista para a raiz da pasta
cp "$INSTALL_DIR/scanner-dns/scanner.sh" "$INSTALL_DIR/"
cp "$INSTALL_DIR/scanner-dns/lista.txt" "$INSTALL_DIR/"

# Cria comando global no Termux
ln -sf "$INSTALL_DIR/scanner.sh" "$PREFIX/bin/scanner"

echo -e "\n✅ Instalado com sucesso em: $INSTALL_DIR"
echo -e "✏️ Edite o arquivo 'lista.txt' com seus domínios."
echo -e "👉 Execute com: scanner"
