# Login direto Specification

**Pedido**: 2026-10-30 - user: "Remova as bibliotecas de login via google e firebase, a tela de login deve ser apenas um botão com acesso direto"

## Problem Statement

O app dependia de Firebase e Google para entrar, e o projeto não quer mais essa autenticação. A tela de login deve dar acesso direto ao app.

## Goals

- [ ] Entrar no app com um único toque, sem conta
- [ ] Remover do projeto as bibliotecas de Firebase e de login Google

## Out of Scope

| Feature | Reason |
| ------- | ------ |
| Tela de boas-vindas | O pedido trata só da tela de login |
| Migração de SDK e dependências restantes | Mudança separada |
| Remoção de `User` e `Prefs` | Não dependem de Firebase |

## Assumptions & Open Questions

| Assumption / decision | Chosen default | Rationale | Confirmed? |
| --------------------- | -------------- | --------- | ---------- |
| Rótulo do botão | "ENTRAR" | Rótulo que a tela já usava | n |
| Caminho até o login | Mantém "JÁ TENHO UMA CONTA" na boas-vindas | Fora do pedido | n |

**Open questions:** none - all resolved or logged above.

## User Stories

### P1: Acesso direto ⭐ MVP

**User Story**: As a aprendiz, I want entrar com um botão so that eu use o app sem criar conta.

**Why P1**: É o pedido inteiro.

**Acceptance Criteria**:

1. The system SHALL exibir na tela de login somente o botão "ENTRAR"
2. WHEN o aprendiz toca em "ENTRAR" THEN the system SHALL abrir a tela Home
3. The system SHALL compilar sem as dependências `firebase_auth`, `firebase_core`, `flutter_auth_buttons` e `google_sign_in`

**Independent Test**: abrir o login, tocar em "ENTRAR" e ver a Home.

## Requirement Traceability

| Requirement ID | Story | Phase | Status |
| -------------- | ----- | ----- | ------ |
| LOGIN-01 | P1: Acesso direto | Execute | Implementing |
| LOGIN-02 | P1: Acesso direto | Execute | Implementing |
| LOGIN-03 | P1: Acesso direto | Execute | Implementing |

## Success Criteria

- [ ] Do login à Home com um toque

## Checks

**Mutations**: 3
**Build**: `flutter build apk --debug`

**C1** - O login mostra apenas o botão "ENTRAR" (LOGIN-01, AC 1)
Proof: `flutter test test/login_page_test.dart --plain-name "login mostra apenas o botao ENTRAR"`

**C2** - Tocar em "ENTRAR" abre a Home (LOGIN-02, AC 2)
Proof: `flutter test test/login_page_test.dart --plain-name "tocar em ENTRAR abre a Home"`

**C3** - O app compila sem as dependências removidas (LOGIN-03, AC 3)
Proof: `flutter build apk --debug`
