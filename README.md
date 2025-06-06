
# Scanner DNS

Ferramenta para análise e validação de domínios via DNS e HTTP, útil para encontrar domínios utilizáveis em SNI, tunneling e outras aplicações de rede.

## 📥 Instalação rápida

curl -sL https://raw.githubusercontent.com/ffontinele/scanner-dns/refs/heads/main/install.sh | bash
curl -sSL https://raw.githubusercontent.com/ffontinele/scanner-dns/main/install.sh | bash

## 🚀 Uso básico

```bash
bash scan.sh lista.txt
```

📄 Onde `lista.txt` é o arquivo de entrada contendo os domínios a serem testados.

## 📁 Saídas geradas

- `validos_sni.txt` – Domínios válidos para SNI (porta 443)
- `validos_http.txt` – Domínios válidos na porta 80
- `relatorio.csv` – Relatório detalhado em formato CSV
- `relatorio.json` – Relatório em formato JSON

## 💡 Autor

Criado por [ffontinele](https://github.com/ffontinele)
