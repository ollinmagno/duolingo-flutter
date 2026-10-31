# Interação da Introdução Specification

**Pedido**: 2026-10-31 - user: "No menu principal, crie uma interação simples no botão do \"ovo\" em introdução ?"

## Problem Statement

O círculo da lição "Introdução" não reagia ao toque, e a tela de lição ainda não existe.

## Goals

- [ ] O círculo do ovo responde ao toque e informa o estado da lição

## Out of Scope

| Feature | Reason |
| ------- | ------ |
| Tela de lição e exercícios | Feature nova |
| Toque nas outras lições | O pedido trata só do ovo |

## Assumptions & Open Questions

| Assumption / decision | Chosen default | Rationale | Confirmed? |
| --------------------- | -------------- | --------- | ---------- |
| Tipo de interação | Efeito de toque e painel inferior | Interação simples, sem nova tela | n |
| Texto do painel | "Esta lição estará disponível em breve." | A lição ainda não existe | n |

**Open questions:** none - all resolved or logged above.

## User Stories

### P1: Tocar no ovo ⭐ MVP

**User Story**: As a aprendiz, I want tocar na Introdução so that eu saiba o estado da lição.

**Why P1**: É o pedido inteiro.

**Acceptance Criteria**:

1. WHEN o aprendiz toca no círculo "Introdução" THEN the system SHALL abrir um painel com o título "Introdução" e o texto "Esta lição estará disponível em breve."
2. WHEN o aprendiz toca em "ENTENDI" THEN the system SHALL fechar o painel
3. WHEN o aprendiz toca em outra lição THEN the system SHALL manter o painel fechado

**Independent Test**: tocar no ovo, ver o painel e fechá-lo em "ENTENDI".

## Requirement Traceability

| Requirement ID | Story | Phase | Status |
| -------------- | ----- | ----- | ------ |
| INTRO-01 | P1: Tocar no ovo | Execute | Implementing |
| INTRO-02 | P1: Tocar no ovo | Execute | Implementing |
| INTRO-03 | P1: Tocar no ovo | Execute | Implementing |

## Success Criteria

- [ ] Do ovo ao painel com um toque

## Checks

**Mutations**: 3
**Build**: `flutter analyze; flutter build apk --debug`

**C1** - Tocar no ovo abre o painel, e ENTENDI fecha (INTRO-01, AC 1; INTRO-02, AC 2)
Proof: `flutter test test/app_test.dart --plain-name "tocar no ovo abre o painel e ENTENDI fecha"`

**C2** - Tocar em outra lição não abre o painel (INTRO-03, AC 3)
Proof: `flutter test test/app_test.dart --plain-name "tocar em outra licao nao abre o painel"`
