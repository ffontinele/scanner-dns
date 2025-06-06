#!/bin/bash

# Caminho base onde será instalado o ScannerDNS
PASTA="$HOME/Documentos/ScannerDNS"

# Criando pasta se não existir
mkdir -p "$PASTA"

# Clonando ou atualizando repositório
if [ -d "$PASTA/.git" ]; then
    echo "🔄 Atualizando projeto existente..."
    git -C "$PASTA" pull
else
    echo "📥 Baixando projeto ScannerDNS..."
    git clone https://github.com/ffontinele/scanner-dns "$PASTA"
fi

# Indo para o diretório
cd "$PASTA" || exit 1

# Garantir que lista.txt existe e tem alguns domínios
if [ ! -s lista.txt ]; then
    echo "🌐 Criando arquivo lista.txt com domínios de teste..."
    cat <<EOF > lista.txt
www.google.com
www.cloudflare.com
www.wikipedia.org
www.youtube.com
EOF
else
    echo "📄 lista.txt já existe e não está vazia."
fi

# Tornando scanner.sh executável
chmod +x scanner.sh

# Criando atalho global 'scanner'
mkdir -p "$HOME/bin"
ln -sf "$PASTA/scanner.sh" "$HOME/bin/scanner"

# Garantindo que o $HOME/bin está no PATH
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.profile"
    echo '🔧 PATH atualizado. Reinicie o Termux ou terminal para aplicar.'
fi

# Confirmação final
echo
echo "✅ Instalação concluída!"
echo "📁 Caminho: $PASTA"
echo "🚀 Use o comando: scanner"
