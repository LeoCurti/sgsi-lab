# Hardening SSH

Desabilitar login root

- [ ] PermitRootLogin no

Mudar porta SSH

- [ ] Port 20000

Ativar autenticação por chave

- [ ] PasswordAuthentication no

\- Após mudar a porta de acesso ssh para 20000, é preciso alterar a regra no firewall no console do AWS

&nbsp;

# Firewall básico

\- Instalar o ufw

\- Bloqueia toda entrada que não for explicitamente definida e libera toda saída

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

\- Permite acesso à porta 20000 (ssh) e 443 (web)

```
sudo ufw allow 20000
sudo ufw allow 443
```

&nbsp;- Ativar o ufw

```
sudo ufw enable
```

\- Verificar regras

```
ufw status verbose 
```
&nbsp;

# Monitoramento + Resposta

\- Instalar o fail2ban

\- Crie um arquivo de configuração local, nunca edite o arquivo `jail.conf` diretamente. Faça uma cópia do jail.conf chamada `jail.local` para suas personalizações, pois o Fail2ban prioriza este arquivo.

```
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local  
nano /etc/fail2ban/jail.local
```

- **ignoreip**: Adicione seu IP fixo ou rede local para evitar ser banido acidentalmente (ex: `127.0.0.1/8 ::1 192.168.1.5`).
- **bantime**: Tempo que o IP ficará bloqueado (ex: `10m` para 10 minutos ou `1h`).
- **findtime**: Janela de tempo onde as falhas são contadas.
- **maxretry**: Número de falhas permitidas antes do banimento.

\- Ativar proteção para SSH e HTTP/HTTPS na sessão JAILS:

Para monitorar quem foi banido, use o comando do cliente:

- **Ver status geral**: `sudo fail2ban-client status`
- **Ver IPs banidos no SSH**: `sudo fail2ban-client status sshd`
- **Desbanir um IP**: `sudo fail2ban-client set sshd unbanip SEU_IP`

### 1\. Identificação do Log

Como o sistema não utiliza `/var/log/auth.log`, as tentativas de conexão são registradas no **journal** do sistema. O Fail2ban deve ser configurado para ler esse backend.

### 2\. Ajuste do Filtro (Modo Agressivo)

Conexões negadas por chave pública (`publickey`) ou encerradas na pré-autenticação (`preauth`) só são capturadas pelo modo agressivo do filtro `sshd`.

### 3\. Configuração do Jail (`/etc/fail2ban/jail.local`)

```
enabled = true  
port = 20000  
logpath = %(sshd_log)s  
backend = %(sshd_backend)s  
mode = aggressive  
banaction = ufw
```
