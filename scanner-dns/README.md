
# Scanner de Domínios (SNI / HTTP)

Este script testa domínios para uso como payloads/SNI, verificando DNS, HTTP, portas 80 e 443.

## 🚀 Instalação rápida

```bash
curl -O https://raw.githubusercontent.com/SEU_USUARIO_GITHUB/scanner-dns/main/install.sh
bash install.sh
```

## 📂 Estrutura criada
- `Documentos/DOMINIOS_SCANEADOS_OK/validos_sni.txt`
- `.../validos_http.txt`
- `.../relatorio.csv` e `relatorio.json`
- `.../payloads/` (com payloads automáticos)

## ✏️ Uso
1. Edite `lista.txt` com seus domínios (um por linha).
2. Execute o script:

```bash
./scanner.sh
```
