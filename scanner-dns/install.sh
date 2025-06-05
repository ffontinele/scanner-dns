01  #!/bin/bash
02  
03  echo "🔧 Instalando ScannerDNS..."
04  
05  # Caminho de instalação
06  INSTALL_DIR="$HOME/ScannerDNS"
07  
08  # Clona o repositório
09  git clone https://github.com/ffontinele/scanner-dns.git "$INSTALL_DIR" || {
10    echo "❌ Falha ao clonar o repositório."
11    exit 1
12  }
13  
14  # Dá permissão ao script principal
15  chmod +x "$INSTALL_DIR/scanner.sh"
16  
17  # Cria o comando global 'scanner'
18  echo -e "#!/bin/bash\ncd \"$INSTALL_DIR\" && ./scanner.sh \"\$@\"" > "$PREFIX/bin/scanner"
19  
20  # Dá permissão ao comando e garante acesso ao diretório
21  chmod +x "$PREFIX/bin/scanner"
22  chmod 755 "$PREFIX/bin"
23  
24  echo "✅ Instalado com sucesso!"
25  echo "👉 Agora você pode usar o comando: scanner"
26  
27  # Instalação da cópia em Documentos (opcional)
28  echo "🔧 Instalando o Scanner de Domínios..."
29  DEST="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
30  mkdir -p "$DEST"
31  
32  cp "$INSTALL_DIR/scanner.sh" "$DEST/"
33  cp "$INSTALL_DIR/lista.txt" "$DEST/"
34  chmod +x "$DEST/scanner.sh"
35  
36  echo "✅ Instalado com sucesso em: $DEST"
37  echo "👉 Edite o arquivo 'lista.txt' com seus domínios."
38  echo "👉 Execute com: ./scanner.sh (dentro da pasta) ou use o comando: scanner"
