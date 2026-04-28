# SGSI Lab - Monitoramento e Resposta a Incidentes

Projeto prático de implementação de um Sistema de Gestão de Segurança da Informação (SGSI) em ambiente Linux, com foco em detecção e resposta a eventos suspeitos de conexão SSH.

---

## Inventário

Servidor Debian 13 hospedado na AWS.


## Objetivo

Implementar controles de segurança baseados em boas práticas, incluindo hardening, monitoramento e resposta automatizada a incidentes.

---

## Arquitetura

- Servidor: Debian 13 (AWS)
- Serviços:
  - SSH (porta 20000)
  - Apache (HTTPS)
- Ferramentas:
  - Fail2ban
  - UFW
  - journalctl

---

## Detecção

Monitoramento baseado em análise de logs do systemd (`journalctl`), identificando eventos suspeitos como:

- Invalid user
- Connection closed
- Banner exchange
- Connection closed
---

## Resposta

- Bloqueio automático com Fail2ban
- Contenção manual com UFW
- Playbook estruturado para resposta a incidentes

---

## Exemplo de detecção real
--------------------------------------------------
   Relatório de Bloqueios Fail2Ban
--------------------------------------------------

[+] Jails ativas no sistema:
	apache-auth, sshd

[+] IPs bloqueados atualmente:
	56.125.231.148

[+] Histórico de Bans:
      2 56.125.231.148

[+] Últimos 5 bloqueios registrados no log:
2026-04-28 13:52:44,790 -> 56.125.231.148

[+] Eventos suspeitos SSH (últimos 5 minutos):
      9 56.125.231.148

--------------------------------------------------

## Playbook

Ver arquivo `playbook.md`

---

## Script

Script de monitoramento disponível em `bans.sh`

---

## Resultados

- Detecção de comportamento automatizado
- Bloqueio efetivo de IP malicioso
- Correlação entre logs e resposta automática

---

## Aprendizados

- Implementação prática de controles de segurança
- Análise de logs com journalctl
- Automação de resposta com Fail2ban
- Estruturação de playbook de incidentes

---
