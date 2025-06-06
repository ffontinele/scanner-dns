#!/bin/bash

echo -e "\n🛠️  Instalando o ScannerDNS...\n"

INSTALL_DIR="$HOME/Documentos/PROJETOS_SCANNERS_OK"
PROJECT_FOLDER="ScannerDNS"
FINAL_DIR="$INSTALL_DIR/$PROJECT_FOLDER"
BIN_PATH="$HOME/.local/bin"

# Remove tudo se já existir
echo -e "🧹 Limpando instalações anteriores..."
rm -rf "$FINAL_DIR"

# Cria diretório de destino
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1

echo -e "📥 Baixando arquivos do GitHub...\n"
git clone https://github.com/ffontinele/scanner-dns "$PROJECT_FOLDER"

# Torna o script executável
chmod +x "$FINAL_DIR/scanner.sh"

# Garante que a pasta ~/.local/bin existe
mkdir -p "$BIN_PATH"

# Cria atalho global
ln -sf "$FINAL_DIR/scanner.sh" "$BIN_PATH/scanner"

# Adiciona ~/.local/bin ao PATH se necessário
if [[ ":$PATH:" != *":$BIN_PATH:"* ]]; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc" 2>/dev/null
fi

# Mensagem final
if command -v scanner >/dev/null 2>&1; then
    echo -e "\n✅ Instalação concluída com sucesso!"
    echo -e "📌 Execute com o comando: \033[1mscanner\033[0m"
else
    echo -e "\n⚠️  Atalho global não criado."
    echo -e "👉 Execute com: bash $FINAL_DIR/scanner.sh"
