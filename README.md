# SGSI Lab - Monitoramento e Resposta a Incidentes

Projeto prático de segurança da informação simulando um ambiente real exposto à internet, com implementação de controles de hardening, monitoramento e resposta automatizada a incidentes.
---
## Destaques

- Detecção de eventos suspeitos via `journalctl`
- Resposta automática com `Fail2ban`
- Hardening completo de SSH
- Script de análise de eventos em tempo real
- Playbook estruturado de resposta a incidentes

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

## Resultado real

Durante testes controlados, foi possível identificar e bloquear automaticamente um IP com comportamento suspeito:

<img width="481" height="488" alt="image" src="https://github.com/user-attachments/assets/59fe9e69-daf4-4b85-83d6-cf34f9552e22" />


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
