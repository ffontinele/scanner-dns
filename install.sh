#!/bin/bash

echo -e "🛠️ \e[1;32mIniciando a instalação do ScannerDNS...\e[0m"

INSTALL_DIR="$HOME/Documentos/ScannerDNS"
BIN_FILE="$PREFIX/bin/scanner"

# Remover pasta antiga se existir
if [ -d "$INSTALL_DIR" ]; then
  echo -e "⚠️  \e[1;33mPasta existente encontrada. Removendo...\e[0m"
  rm -rf "$INSTALL_DIR"
fi

# Clonar repositório
echo -e "📥 \e[1;34mBaixando arquivos do projeto...\e[0m"
git clone https://github.com/ffontinele/scanner-dns "$INSTALL_DIR" &>/dev/null

# Dar permissão de execução
chmod +x "$INSTALL_DIR/.scanner.sh"

# Criar atalho no bin
echo "#!/bin/bash
bash $INSTALL_DIR/.scanner.sh" > "$BIN_FILE"
chmod +x "$BIN_FILE"

echo -e "✅ \e[1;32mInstalação concluída com sucesso!\e[0m"
echo -e "\e[1;36mPara iniciar, digite: \e[1;33mscanner\e[0m"
