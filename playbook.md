# Playbook de incidente

### Evento: conexão SSH não autorizada

### Fonte: journalctl + Fail2ban

### Tipo: evento suspeito de conexão SSH (brute force / enumeração / scan automatizado)

### Objetivo:

- Padronizar a detecção, análise e resposta a eventos suspeitos de conexão SSH, garantindo rápida identificação e contenção de possíveis tentativas de acesso não autorizado.

### Escopo:

- Aplica-se ao servidor Debian 13 exposto à internet, com serviços SSH e HTTPS habilitados.

### Critério de detecção:

- Identificar IP com mais de 5 eventos suspeitos no período de 10 minutos
- Eventos considerados -> Invalid user / Connection closed / banner exchange / Connection reset

## Procedimento de resposta

### 1. Identificação:

- [ ] Executar script de monitoramento
- [ ] Validar IP com alta frequência de eventos

### 2. Ferramenta:

- Mecanismo de detecção baseado em análise de logs via journalctl (script bans.sh)

### 3. Análise:

- Verificar IP
    
- [ ] whois IP
    
- Verificar histórico:
    
- [ ] journalctl -u ssh | grep IP
    
- Verificar sucesso de login:
    
- [ ] journalctl -u ssh | grep "Accepted"
    

### 4. Classificação de severidade:

- Baixo:
    
- [ ] 1-3 eventos suspeitos
    
- Médio:
    
- [ ] 4-5 eventos suspeitos
    
- Alto:
    
- [ ] mais de 5 eventos suspeitos em 10 minutos ou múltiplos IPs

### 5. Se necessário, contenção manual:

- Verificar se o Fail2ban já bloqueou:
    
- [ ] fail2ban-client status sshd
    
- Caso não:
    
- [ ] ufw deny from IP

### 6. Registro do incidente:

Criar arquivo no modelo seguinte:

- Data: DD-MM-YYYY HH:MM
    
- IP: IP detectado
    
- Tipo: Tentativa de acesso SSH não autorizado
    
- Severidade: (Baixo/Médio/Alto)
    
- Ação tomada: (Bloqueio automático / manual)
    
- Observação: (ex: múltiplas tentativas em curto período)

### 7. Indicadores de comprometimento (IoC):

- IP com alta frequência de conexões SSH
- Múltiplos eventos "Invalid user"
- Padrão repetitivo de conexão em curto intervalo

### 8. Escalonamento:

- [ ] Caso haja múltiplos IPs ou aumento contínuo de eventos:
    
- [ ] Revisar regras do firewall
    
- [ ] Avaliar bloqueio por range de IP
    
- [ ] Considerar ajuste no Fail2ban (reduzir maxretry / aumentar bantime)

### 9. Lições aprendidas:

- Melhorar regra do Fail2ban
- Bloquear ranges específicos

&nbsp;
