#!/bin/bash

# Caminho da instalação
PASTA="$HOME/Documentos/ScannerDNS"

# Cria pasta de instalação
mkdir -p "$PASTA"

# Move arquivos para a pasta
mv scanner.sh install.sh testador.sh lista.txt "$PASTA" 2>/dev/null

# Dá permissões
chmod +x "$PASTA/"*.sh

# Cria o comando global 'scanner'
echo -e "#!/bin/bash\nbash \"$PASTA/scanner.sh\"" > "$HOME/.scanner"
chmod +x "$HOME/.scanner"

# Adiciona ao PATH se não estiver
if ! grep -q 'export PATH=$HOME' ~/.bashrc 2>/dev/null; then
    echo 'export PATH=$HOME:$PATH' >> ~/.bashrc
fi
if ! grep -q 'export PATH=$HOME' ~/.profile 2>/dev/null; then
    echo 'export PATH=$HOME:$PATH' >> ~/.profile
fi

echo
echo "✅ Instalação concluída!"
echo "➡️  Agora você pode rodar: scanner"
