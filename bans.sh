#!/bin/bash
LOG_FILE="/var/log/fail2ban.log"

echo "--------------------------------------------------"
echo "   Relatório de Bloqueios Fail2Ban"
echo "--------------------------------------------------"

# Listar Jails ativas
echo -e "\n[+] Jails ativas no sistema:"
fail2ban-client status | grep "Jail list" | sed 's/`- Jail list://'

# Resumo de IPs bloqueados no momento na jail ssh
echo -e "\n[+] IPs bloqueados atualmente:"
fail2ban-client status sshd | grep "Banned IP list" | cut -d: -f2

# Histórico de Bans (Geral)
echo -e "\n[+] Histórico de Bans (Total por IP - Top 10):"
if [ -f "$LOG_FILE" ]; then
    # Filtra "Ban", extrai o IP (última coluna), conta, ordena e mostra o top 10
    grep "Ban " $LOG_FILE | awk '{print $NF}' | sort | uniq -c | sort -nr | head -n 10
else
    echo "Erro: Arquivo de log não encontrado em $LOG_FILE"
fi

# Últimos 5 bans registrados cronologicamente
echo -e "\n[+] Últimos 5 bloqueios registrados no log:"
grep "Ban " $LOG_FILE | tail -n 5 | awk '{print $1, $2, "->", $NF}'


# Lê o log ssh diretamente do journal
echo -e "\n[+] Eventos suspeitos SSH (últimos 5 minutos):"

journalctl -u ssh --since "5 minutes ago" \
| grep -E "Invalid user|Connection closed|banner exchange|Connection reset" \
| grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' \
| sort | uniq -c | sort -nr | head -n 10

echo -e "\n--------------------------------------------------"
