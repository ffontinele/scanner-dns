#!/bin/bash

echo -e "\n🛠️  Instalando o ScannerDNS...\n"

# Diretório base
if [ "$PREFIX" ]; then
  FINAL_DIR="$HOME/Documentos/ScannerDNS"
  BIN_DIR="$PREFIX/bin"
else
  FINAL_DIR="$HOME/Documentos/ScannerDNS"
  BIN_DIR="/usr/local/bin"
fi

# Criar pastas, se não existirem
mkdir -p "$FINAL_DIR"

# Limpar instalação anterior
echo -e "🧹 Limpando instalações anteriores..."
rm -rf "$FINAL_DIR"
rm -f "$BIN_DIR/scanner"

# Clonar repositório
echo -e "📥 Baixando arquivos do GitHub..."
git clone https://github.com/ffontinele/scanner-dns.git "$FINAL_DIR"

# Criar lista.txt com domínios de teste
echo -e "🌐 Criando lista padrão de domínios (lista.txt)..."
cat <<EOF > "$FINAL_DIR/lista.txt"
www.google.com
www.cloudflare.com
www.wikipedia.org
www.youtube.com
EOF

# Garantir permissão de execução
chmod +x "$FINAL_DIR/scanner.sh"

# Criar atalho global
echo -e "🔗 Criando atalho global..."
echo -e "#!/bin/bash\nbash \"$FINAL_DIR/scanner.sh\" \"\$@\"" > "$BIN_DIR/scanner"
chmod +x "$BIN_DIR/scanner"

echo -e "\n✅ ScannerDNS instalado com sucesso!"
echo -e "📁 Diretório: $FINAL_DIR"
echo -e "📌 Use o comando: \033[1;32mscanner\033[0m para iniciar.\n"
