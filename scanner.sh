#!/bin/bash
# Caminho raiz baseado no local do script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$HOME/Documentos/DOMINIOS_SCANEADOS_OK"
PAYLOAD_DIR="$BASE_DIR/payloads"
LISTA="$SCRIPT_DIR/lista.txt"

# Criar pastas necessárias
mkdir -p "$PAYLOAD_DIR"

# Arquivos de saída
ARQ_OK="$BASE_DIR/validos_sni.txt"
ARQ_HTTP="$BASE_DIR/validos_http.txt"
ARQ_RELATORIO="$BASE_DIR/relatorio.csv"
ARQ_JSON="$BASE_DIR/relatorio.json"

# Limpar arquivos anteriores
> "$ARQ_OK"
> "$ARQ_HTTP"
> "$ARQ_RELATORIO"
echo "[" > "$ARQ_JSON"

LINHAS=$(wc -l < "$LISTA")
COUNT=0

while IFS= read -r DOM; do
  COUNT=$((COUNT + 1))
  echo -e "\n🔵 Testando: \e[1m$DOM\e[0m"

  # Teste DNS
  if ping -c 1 -W 1 "$DOM" &>/dev/null; then
    DNS_OK="✅"
    DNS_BOOL=true
  else
    DNS_OK="❌"
    DNS_BOOL=false
  fi

  # Teste HTTP
  if curl -s --max-time 5 "http://$DOM" >/dev/null; then
    HTTP_OK="✅"
    HTTP_BOOL=true
    echo "$DOM" >> "$ARQ_HTTP"
  else
    HTTP_OK="❌"
    HTTP_BOOL=false
  fi

  # Teste porta 80
  if timeout 3 bash -c "</dev/tcp/$DOM/80" &>/dev/null; then
    P80_OK="✅"
    P80_BOOL=true
  else
    P80_OK="❌"
    P80_BOOL=false
  fi

  # Teste porta 443
  if timeout 3 bash -c "</dev/tcp/$DOM/443" &>/dev/null; then
    P443_OK="✅"
    P443_BOOL=true
    echo "$DOM" >> "$ARQ_OK"
  else
    P443_OK="❌"
    P443_BOOL=false
  fi

  echo -e " - DNS:      $DNS_OK"
  echo -e " - HTTP:     $HTTP_OK"
  echo -e " - Porta 80: $P80_OK"
  echo -e " - Porta 443:$P443_OK"

  if $DNS_BOOL && $HTTP_BOOL && $P443_BOOL; then
    echo -e "✅ \e[1;32mDomínio válido para SNI\e[0m"

    PAYLOAD_FILE="$PAYLOAD_DIR/${DOM//\//_}.payloads.txt"

    {
      echo "[GET Simples]"
      echo -e "GET / HTTP/1.1"
      echo -e "Host: $DOM"
      echo -e "Connection: Keep-Alive\n"

      echo "[WebSocket]"
      echo -e "GET / HTTP/1.1"
      echo -e "Host: $DOM"
      echo -e "Upgrade: websocket"
      echo -e "Connection: Upgrade"
      echo -e "Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw=="
      echo -e "Sec-WebSocket-Version: 13\n"

      echo "[TLS SNI]"
      echo -e "TLS handshake with SNI set to: $DOM\n"

      echo "[HTTP/2]"
      echo -e ":method: GET"
      echo -e ":scheme: https"
      echo -e ":authority: $DOM"
      echo -e ":path: /\n"
    } > "$PAYLOAD_FILE"

  else
    echo -e "❌ \e[1;31mDomínio com falhas.\e[0m"
  fi

  echo "$DOM,$DNS_BOOL,$HTTP_BOOL,$P80_BOOL,$P443_BOOL" >> "$ARQ_RELATORIO"

  echo "  {" >> "$ARQ_JSON"
  echo "    \"dominio\": \"$DOM\"," >> "$ARQ_JSON"
  echo "    \"dns\": $DNS_BOOL," >> "$ARQ_JSON"
  echo "    \"http\": $HTTP_BOOL," >> "$ARQ_JSON"
  echo "    \"porta_80\": $P80_BOOL," >> "$ARQ_JSON"
  echo "    \"porta_443\": $P443_BOOL" >> "$ARQ_JSON"
  echo -n "  }" >> "$ARQ_JSON"
  [ $COUNT -lt $LINHAS ] && echo "," >> "$ARQ_JSON" || echo "" >> "$ARQ_JSON"

done < "$LISTA"

echo "]" >> "$ARQ_JSON"

echo -e "\n✅ \e[1;32mVarredura concluída!\e[0m"
echo "Arquivos gerados em: $BASE_DIR"
