#!/bin/bash

echo "🔧 Instalando ScannerDNS..."

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

# Confirma se o comando está disponível
hash scanner 2>/dev/null || echo "⚠️ Comando 'scanner' pode não estar disponível ainda."

echo "✅ Instalado com sucesso!"
echo "👉 Agora você pode usar o comando: scanner"

# Cria cópia do script e lista para uso separado
DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
mkdir -p "$DEST"

cp "$INSTALL_DIR/scanner.sh" "$DEST/"
cp "$INSTALL_DIR/lista.txt" "$DEST/"
chmod +x "$DEST/scanner.sh"

echo "✅ Instalado com sucesso em: $DEST"
echo "👉 Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Ou use diretamente com o comando: scanner"

GitHub (https://github.com/ffontinele/scanner-dns.git)
ffontinele/scanner-dns
escript para escanear domínios e gerar payloads automáticas (SNI, HTTP) - ffontinele/scanner-dns
