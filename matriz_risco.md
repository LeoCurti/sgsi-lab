# Identificação de riscos

Atualmente, por ser um sistema de testes, considera-se como um sistema de nível de criticidade médio

| Serviço | Ameaça | Vulnerabilidade | Impacto |
| --- | --- | --- | --- |
| SSH | A1 - brute force  <br><br/>   <br><br/>A2 - exploit | senha fraca   <br><br/>login permitido por senha  <br><br/>versão desatualizada | alto - acesso indevido  <br><br/>alto - acesso indevido  <br><br/>médio |
| Web | A3 - falha de segurança no código | SQLI  <br><br/>RFI / LFI | alto - descoberta de informções  <br><br/>alto - possível rce |

&nbsp;

# Matriz de risco

| Ameaça | Risco | Probabilidade (1-5) | Impacto (1-5) | Risco (P x I) |
| --- | --- | --- | --- | --- |
| A1  | R1  | 5   | 5   | 25  |
| A2  | R2  | 3   | 4   | 12  |
| A3  | R3  | 3   | 5   | 15  |
