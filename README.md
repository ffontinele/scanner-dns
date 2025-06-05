
# Scanner DNS

Ferramenta para análise e validação de domínios via DNS e HTTP, útil para encontrar domínios utilizáveis em SNI, tunneling e outras aplicações de rede.

## 📥 Instalação rápida

```bash
git clone https://github.com/ffontinele/scanner-dns.git && cd scanner-dns
chmod +x scan.sh
```

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
