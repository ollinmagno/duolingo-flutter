# STATE

## Decisions

### AD-001
- **Decision**: O app não tem autenticação; o login é um botão de acesso direto, sem Firebase nem Google.
- **Reason**: Pedido do usuário: "Remova as bibliotecas de login via google e firebase, a tela de login deve ser apenas um botão com acesso direto".
- **Trade-off**: Não há conta, nome de usuário nem progresso por pessoa.
- **Scope**: `features/auth` e qualquer feature que dependa de identidade do usuário.
- **Date**: 2026-10-30
- **Status**: active

### AD-002
- **Decision**: A base atual roda em Flutter 2.0.6 e Dart 2.12, sem null-safety, apesar de a stack alvo do `AGENTS.md` ser mais nova.
- **Reason**: É a primeira versão estável com suporte web que ainda aceita o código e a configuração Android antigos (Gradle 5.4.1, AGP 3.5.1, Android embedding v1).
- **Trade-off**: O projeto fica distante do Flutter atual até uma migração específica.
- **Scope**: Todo o projeto; só vale até a spec de migração da stack.
- **Date**: 2026-10-30
- **Status**: active

## Handoff
