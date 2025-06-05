#!/bin/bash

echo "🔧 Instalando ScannerDNS..."

# Caminho padrão para instalação
INSTALL_DIR="$HOME/ScannerDNS"

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
echo "🔧 Instalando o Scanner de Domínios..."

DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
mkdir -p "$DEST"

cp "$INSTALL_DIR/scanner.sh" "$DEST/"
cp "$INSTALL_DIR/lista.txt" "$DEST/"
chmod +x "$DEST/scanner.sh"

echo "✅ Instalado com sucesso em: $DEST"
echo "👉 Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: ./scanner.sh"
