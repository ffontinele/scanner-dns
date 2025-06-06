#!/bin/bash

echo -e "\n⚙️  Instalando o ScannerDNS...\n"

FINAL_DIR="$HOME/Documentos/ScannerDNS"
BIN_PATH="$HOME/.local/bin"
LINK_NAME="$BIN_PATH/scanner"

echo "🧹 Limpando instalações anteriores..."
rm -rf "$FINAL_DIR"
rm -f "$LINK_NAME"

echo -e "\n📥 Baixando arquivos do GitHub..."
git clone https://github.com/ffontinele/scanner-dns.git "$FINAL_DIR"

# Criação de atalho apenas se não existir
if [ ! -f "$LINK_NAME" ]; then
    echo -e "\n🚧 Criando atalho global..."
    mkdir -p "$BIN_PATH"
    echo -e "#!/bin/bash\nbash \"$FINAL_DIR/scanner.sh\" \"\$@\"" > "$LINK_NAME"
    chmod +x "$LINK_NAME"
fi

echo -e "\n✅ ScannerDNS instalado com sucesso!"
echo -e "📁 Diretório: $FINAL_DIR"
echo -e "📌 Use o comando: \e[1mscanner\e[0m para iniciar."
