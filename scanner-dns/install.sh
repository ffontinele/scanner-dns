#!/bin/bash
echo "🔧 Instalando o Scanner de Domínios..."

DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
mkdir -p "$DEST"

cp scanner.sh "$DEST/"
cp lista.txt "$DEST/"
chmod +x "$DEST/scanner.sh"

echo "✅ Instalado com sucesso em: $DEST"
echo "👉 Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: ./scanner.sh"
