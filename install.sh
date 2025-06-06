#!/bin/bash

echo -e "\n🛠️  Instalando o ScannerDNS...\n"

# Caminho de instalação
INSTALL_DIR="$HOME/Documentos/PROJETOS_SCANNERS_OK"

# Nome da pasta final do projeto
PROJECT_FOLDER="ScannerDNS"

# Caminho completo final
FINAL_DIR="$INSTALL_DIR/$PROJECT_FOLDER"

# Clonando o repositório atualizado
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit

echo -e "📥 Baixando arquivos do GitHub...\n"
git clone https://github.com/ffontinele/scanner-dns "$PROJECT_FOLDER"

# Permissões e atalho
chmod +x "$FINAL_DIR/scanner.sh"
ln -sf "$FINAL_DIR/scanner.sh" "$HOME/.local/bin/scanner"

# Verifica se o comando scanner está disponível
if command -v scanner >/dev/null 2>&1; then
    echo -e "\n✅ Instalação concluída com sucesso!"
    echo -e "📌 Você pode executar o scanner com o comando: \033[1mscanner\033[0m"
else
    echo -e "\n⚠️  Instalação concluída, mas o atalho global não foi criado."
    echo -e "👉 Execute com: bash $FINAL_DIR/scanner.sh"
