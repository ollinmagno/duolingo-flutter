---
name: conventional-commit
description: 'Semantic commit standards (Conventional Commits, https://www.conventionalcommits.org/). Use when the user asks for a commit message, "conventional commit", or to commit changes. Never run git commit without an explicit request from the user.'
---

# Commit standards

According to the **[Conventional Commits](https://www.conventionalcommits.org/)** documentation, semantic commits are a simple convention for commit messages. This convention defines a set of rules to create an explicit commit history, which makes it easier to build automated tools.

These commits help you and your team understand more easily what changes were made in the committed code.

That identification comes from a keyword that indicates whether the commit is a code change, package update, documentation, visual change, test, and so on.

## Workflow

1. Run `git status` to see the changed files.
2. Run `git diff` and `git diff --cached` to understand the changes.
3. Choose the type and write the message following the standards below.
4. Show the message to the user.
5. **Only run `git add` and `git commit` if the user explicitly asks.** An approved plan or approved message alone does not authorize the commit.

## Format

```
<type>[(optional scope)]: <description>

[optional body]

[optional footer]
```

## Type and description

A semantic commit has the structural elements below (types), which communicate the intent of your commit to anyone using your code.

- `feat` - Commits of type feat indicate that your code change is adding a **new feature** (related to MINOR in semantic versioning).

- `fix` - Commits of type fix indicate that your committed code is **fixing a problem** (bug fix) (related to PATCH in semantic versioning).

- `docs` - Commits of type docs indicate that there were **documentation changes**, for example in your repository README. (Does not include code changes.)

- `test` - Commits of type test are used when there are **test changes**, whether creating, changing, or deleting unit tests. (Does not include production code changes.)

- `build` - Commits of type build are used when there are changes to **build files and dependencies**.

- `perf` - Commits of type perf identify any code changes related to **performance**.

- `style` - Commits of type style indicate changes related to **code formatting**, semicolons, trailing spaces, linting, and so on. (Does not include functional code changes.)

- `refactor` - Commits of type refactor refer to changes from **refactors that do not change behavior**, for example changing how part of a screen is processed while keeping the same functionality, or performance improvements from a code review.

- `chore` - Commits of type chore indicate **build task updates**, admin configuration, packages, and so on — for example adding a package to `.gitignore`. (Does not include production code changes.)

- `ci` - Commits of type ci indicate changes related to **continuous integration**.

- `raw` - Commits of type raw indicate changes related to configuration files, data, features, or parameters.

- `cleanup` - Commits of type cleanup are used to remove commented-out code, unnecessary snippets, or any other form of source cleanup aimed at improving readability and maintainability.

- `remove` - Commits of type remove indicate deletion of obsolete or unused files, directories, or features, reducing project size and complexity and keeping it more organized.

Breaking changes use `!` before the colon (e.g. `feat!:`) or a `BREAKING CHANGE:` footer (related to MAJOR in semantic versioning).

## Recommendations

- Add a type consistent with the content title.
- We recommend the first line should have at most 4 words.
- For more detail, use the commit body.
- Do not use emojis in the commit message.
- Links must be added in their authentic form: no link shorteners and no affiliate links.

## Commit add-ons

- **Body:** more precise descriptions of what the commit contains, covering impacts and the reasons for the code changes, as well as essential guidance for future work.
