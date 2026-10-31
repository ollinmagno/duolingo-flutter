# Refatoração da base Specification

**Pedido**: 2026-10-30 - user: "Use /ponytail:ponytail-audit e refatore o projeto, melhorando a estrutura, ux e desempenho"

## Problem Statement

O código tinha dependências e arquivos sem uso, telas em branco, botões sem ação, medidas fixas que não se adaptam ao aparelho e estrutura diferente da definida no `AGENTS.md`.

## Goals

- [ ] Organizar o código em `core`, `features` e `shared`
- [ ] Remover dependências, código e assets sem uso
- [ ] Nenhum controle sem ação e nenhuma tela em branco

## Out of Scope

| Feature | Reason |
| ------- | ------ |
| Riverpod, go_router e dio | Não há estado global, rotas nomeadas nem rede que os justifiquem |
| Migração para null-safety e Flutter atual | Mudança separada |
| Lição, resultado, ranking, loja e histórias reais | Features novas |
| Android embedding v2 | Mudança separada |

## Assumptions & Open Questions

| Assumption / decision | Chosen default | Rationale | Confirmed? |
| --------------------- | -------------- | --------- | ---------- |
| "COMEÇAR AGORA" | Abre a Home | Era um botão sem ação e não há cadastro | n |
| Botão flutuante de treino e "ADICIONAR AMIGOS" | Removidos | Não tinham ação nem tela de destino | n |
| Cards do perfil | Mostram XP, ofensiva, coroas e gemas fictícios | Substituem o texto "hello" | n |
| Nome no perfil | "Aprendiz" | Sem login não há nome de usuário | n |

**Open questions:** none - all resolved or logged above.

## User Stories

### P1: Navegação sem becos ⭐ MVP

**User Story**: As a aprendiz, I want que cada botão leve a algum lugar so that eu não fique sem saída.

**Why P1**: Botões inertes e telas em branco parecem defeito.

**Acceptance Criteria**:

1. WHEN o aprendiz toca em "COMEÇAR AGORA" THEN the system SHALL abrir a Home sem permitir voltar à tela inicial
2. WHEN o aprendiz toca em "JÁ TENHO UMA CONTA" THEN the system SHALL abrir o login
3. WHEN o aprendiz toca em uma aba THEN the system SHALL tornar essa aba a ativa
4. WHEN o aprendiz volta à aba de lições THEN the system SHALL manter a posição de rolagem
5. The system SHALL exibir todas as telas sem estouro de layout em larguras de 320 e 412 pixels

**Independent Test**: percorrer boas-vindas, login e as cinco abas em uma tela de 320 pixels de largura.

## Requirement Traceability

| Requirement ID | Story | Phase | Status |
| -------------- | ----- | ----- | ------ |
| BASE-01 | P1: Navegação sem becos | Execute | Implementing |
| BASE-02 | P1: Navegação sem becos | Execute | Implementing |
| BASE-03 | P1: Navegação sem becos | Execute | Implementing |
| BASE-04 | P1: Navegação sem becos | Execute | Implementing |
| BASE-05 | P1: Navegação sem becos | Execute | Implementing |

## Success Criteria

- [x] `build/web` de produção menor que a linha de base: de 3492 KB para 3310 KB (`main.dart.js` ficou estável, de 1546 KB para 1551 KB)

## Checks

**Mutations**: 3
**Build**: `flutter analyze; flutter build web --release`

**C1** - "COMEÇAR AGORA" abre a Home sem volta (BASE-01, AC 1)
Proof: `flutter test test/app_test.dart --plain-name "COMECAR AGORA abre a Home sem volta"`

**C2** - "JÁ TENHO UMA CONTA" abre o login (BASE-02, AC 2)
Proof: `flutter test test/app_test.dart --plain-name "JA TENHO UMA CONTA abre o login"`

**C3** - Tocar em uma aba troca a aba ativa (BASE-03, AC 3)
Proof: `flutter test test/app_test.dart --plain-name "tocar em uma aba troca a aba ativa"`

**C4** - A rolagem das lições é preservada (BASE-04, AC 4)
Proof: `flutter test test/app_test.dart --plain-name "trocar de aba preserva a rolagem das licoes"`

**C5** - Nenhuma tela estoura em 320 e 412 pixels (BASE-05, AC 5)
Proof: `flutter test test/app_test.dart --plain-name "nenhuma tela estoura"`
