# AGENTS.md

## Project
Educational Duolingo clone in Flutter: a gamified app with sequential lessons, progress, lives, XP, streaks and screens styled after the original (home, lesson, results, store, leaderboard, profile).

## Target stack
- Flutter/Dart: current stable, `sdk: ">=3.0.0 <4.0.0"`
- Null safety required
- State: Riverpod (or keep the existing one if migrating would cost > 1 phase)
- Navigation: go_router
- HTTP: dio | Local: shared_preferences / drift
- Lints: flutter_lints (or very_good_analysis)
- Android: declarative Gradle plugin, current compileSdk/targetSdk, Kotlin DSL
- iOS: minimum deployment target required by Flutter stable

## Structure

Current project map:

```text
.
├── lib/
│   ├── main.dart                  # app entry point, theme and orientation
│   ├── core/
│   │   ├── theme.dart             # global theme
│   │   └── demo_stats.dart        # fixed demo values
│   ├── features/
│   │   ├── auth/presentation/     # welcome and login
│   │   ├── home/presentation/     # tabs and top bar
│   │   ├── lessons/presentation/  # lesson map and Introduction panel
│   │   └── profile/presentation/  # profile
│   └── shared/widgets/            # PrimaryButton and ComingSoon
├── test/                          # widget tests
├── assets/images/                 # images declared in pubspec.yaml
│   ├── appBar/
│   ├── bottom_navigation_bar/
│   └── home_screen/
├── android/                       # native Android project
├── ios/                           # native iOS project
├── web/                           # web project
├── docs/screenshots/              # screen captures
├── .specs/
│   ├── STATE.md                   # project decisions (AD-NNN) and handoff
│   └── features/<feature>/        # spec.md and captures/
├── .claude/
│   ├── agents/                    # product-owner, tech-lead, dev, qa, security
│   └── skills/                    # project skills
├── .mcp.json                      # agent-skills MCP
├── AGENTS.md
├── README.md
└── pubspec.yaml                   # dependencies and assets
```

Conventions for new code:
- Each feature lives in `lib/features/<feature>/{data,domain,presentation}`. Create only the layers that have content; today only `presentation` exists.
- `lib/core/` holds what is global, such as theme, routes, network and errors.
- `integration_test/` will be created at the root when the first integration test is added.

## Agents
- product-owner: Specify; writes `spec.md`; guards functional parity.
- tech-lead: Design and Tasks; chooses deps, reviews architecture, writes `design.md` and `tasks.md`.
- dev: Execute; one task at a time, test derived from the spec, gate and atomic commit.
- qa: independent Verifier and screen reviewer; does not fix.
- security: audits spec/design and the diff (`pub outdated`, CVEs, secrets, Android/iOS permissions); does not fix.

## Workflow (tlc-spec-driven)
The `tlc-spec-driven` skill, loaded by name through the `agent-skills` MCP, is the source of truth for the process. Artifacts live in `.specs/` and are versioned. Nothing without a spec.

Specify → user approval → (Design) → (Tasks) → user approval → Execute → proofs → Verifier + screens + security → fixes → second round → gate

The main session is the orchestrator. Sub-agents do not talk to the user or dispatch other agents. Before acting, read the skill and, to close a feature, `references/implement.md`, `references/sub-agents.md`, `references/validate.md` and `references/lessons.md`.

1. **Specify.** `product-owner` writes the spec and classifies the scope. Take its questions to the user and return the answers. Only the user approves; the approval is recorded in the user's own words.
2. **Design/Tasks.** `tech-lead`, when the scope requires it. Small/Medium scope skips to Execute. The user approves `tasks.md` before any code.
3. **Prepare.** Outside `.specs/`, the tree must be clean at the start of Execute and at closing; if it is not, stop and tell the user.
4. **Execute.** Implementation is always done by `dev`. Up to ~8 tasks: a single `dev`. Above that: offer the user batches of ~7 tasks made of whole phases, in sequence, and wait for the answer. Use `model: opus` for a batch with a core or ambiguous domain. Record each dispatch in `**Dispatched:**` under `## Handoff` in `tasks.md` before sending it.
5. **Walk.** Feature with a screen: walk through the stories in the app on an emulator or device, save `captures/<capture>.running.png` and write `**Walked:**`. If there is no way to run the app, give the steps to the user and record what they report.
6. **Proofs.** Run `check_proofs.py <feature>`. A red line goes back to `dev` before verifying.
7. **Verification.** In the same turn and on the same `HEAD`, dispatch in parallel: `qa` in Verifier mode; `qa` in screens mode, as a separate instance, if a criterion cites a capture; and `security` on the diff. Pass the feature, files and diff range, never the author's reasoning or what to accept.
8. **Fixes.** All findings go to `dev` in a single pass. Then run `check_proofs.py <feature> --mutations .specs/features/<feature>/mutations.json` and, if there were `differs`, `qa` in screens mode for round 2. There is no second Verifier and no third round; whatever still fails goes to the user.
9. **Gate.** `validate_verification.py <feature>` must exit with 0. Do not commit anything between the last `check_proofs.py` and the gate, because `proofs.md` must match `HEAD`.
10. **Close.** Record the lessons with `lessons.py` and only then commit the `.specs/` reports with `docs(specs): ...`.

Scripts run with `SKILL_DIR` from `prepare_skill_files`, in the same command (`SKILL_DIR="<skill_dir>" && python3 "$SKILL_DIR/scripts/<name>.py" ...`). If execution is denied by permissions: stop and ask the user to allow it, without working around it.

## Commands
flutter pub get
dart fix --apply
dart format .
dart analyze --fatal-infos
flutter test --coverage
flutter build apk --debug
flutter build ios --no-codesign

## Rules
- Atomic commits, Conventional Commits: one per task.
- Approving the spec and tasks authorizes implementation and local commits; push, deploy and destructive operations require explicit authorization.
- Zero warnings in analyze.
- Do not change the state and navigation libraries in the same phase.
- Discontinued deps: replace them, never fork without TL approval.
- No secrets in the code; use --dart-define/an unversioned .env.
- Widgets > 200 lines: extract.
- Every migrated feature: ≥1 widget test.

## Definition of Done
- analyze clean, tests green, Android/iOS builds ok (`flutter build ios` requires macOS; elsewhere, report it as pending)
- spec updated
- `validate_verification.py <feature>` exits with 0
- no visual regression (goldens)
