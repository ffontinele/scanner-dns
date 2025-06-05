#!/bin/bash

echo "🔧 Instalando ScannerDNS..."

INSTALL_DIR="$HOME/ScannerDNS"

# Remove a pasta antiga se existir
if [ -d "$INSTALL_DIR" ]; then
  echo "🧹 Removendo instalação anterior em $INSTALL_DIR..."
  rm -rf "$INSTALL_DIR"
fi

# Clona o repositório do GitHub
git clone https://github.com/ffontinele/scanner-dns.git "$INSTALL_DIR" || {
  echo "❌ Falha ao clonar o repositório."
  exit 1
}

# Dá permissão ao script principal
chmod +x "$INSTALL_DIR/scanner.sh"

# Cria o comando global 'scanner'
echo -e "#!/bin/bash\ncd \"$INSTALL_DIR\" && ./scanner.sh \"\$@\"" > $PREFIX/bin/scanner
chmod +x $PREFIX/bin/scanner

echo "✅ Instalado com sucesso!"
echo "👉 Agora você pode usar o comando: scanner"

# Instala os arquivos também na pasta padrão de domínios
DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
rm -rf "$DEST"
mkdir -p "$DEST"

cp "$INSTALL_DIR/scanner.sh" "$DEST/"
cp "$INSTALL_DIR/lista.txt" "$DEST/"
chmod +x "$DEST/scanner.sh"

echo "✅ Instalado com sucesso em: $DEST"
echo "👉 Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: ./scanner.sh"
