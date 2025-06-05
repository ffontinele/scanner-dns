#!/bin/bash

echo -e "\n📦 Instalando o ScannerDNS...\n"

# Caminho padrão de instalação
INSTALL_DIR=~/Documentos/DOMINIOS_SCANEADOS_OK

# Remove a instalação anterior, se existir
if [ -d "$INSTALL_DIR" ]; then
    echo "🧹 Removendo instalação anterior..."
    rm -rf "$INSTALL_DIR"
fi

# Clona o repositório novamente
git clone https://github.com/ffontinele/scanner-dns "$INSTALL_DIR"

# Cria lista.txt com domínios padrão, se não existir
if [ ! -f "$INSTALL_DIR/lista.txt" ]; then
    echo -e "google.com\nuol.com.br\nglobo.com" > "$INSTALL_DIR/lista.txt"
    echo "📝 Arquivo 'lista.txt' criado com domínios padrão."
fi

# Copia o atalho 'scanner' para uso global no Termux ou Linux
cp "$INSTALL_DIR/scanner.sh" /data/data/com.termux/files/usr/bin/scanner 2>/dev/null || sudo cp "$INSTALL_DIR/scanner.sh" /usr/local/bin/scanner
chmod +x /data/data/com.termux/files/usr/bin/scanner 2>/dev/null || sudo chmod +x /usr/local/bin/scanner

# Dá permissão de execução ao script principal
chmod +x "$INSTALL_DIR/scanner.sh"

echo -e "\n✅ Instalado com sucesso em: $INSTALL_DIR"
echo "📝 Edite o arquivo 'lista.txt' com seus domínios."
echo "👉 Execute com: scanner"
