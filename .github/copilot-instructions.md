# GitHub Copilot Instructions — action_button

You are assisting in building a Flutter package named **action_button**.

## Project Purpose

This package provides a **production-ready async action button abstraction** that standardizes handling of:

- loading
- success
- error
  states during asynchronous actions (e.g., API calls, form submissions).

This is **not a UI kit**.  
This package focuses on **behavior and correctness**, not styling.

---

## Design Principles (STRICT)

- Favor **explicit state management** over magic behavior
- Avoid over-engineering
- Prefer **clarity and maintainability**
- Public APIs must be **small, predictable, and stable**
- Internal logic must be easy to reason about in interviews

---

## What This Package IS

- A reusable Flutter widget for async button actions
- A safe abstraction that prevents double taps
- A state-driven system using explicit enums
- UI-agnostic via a builder pattern

---

## What This Package IS NOT

- ❌ Not a design system
- ❌ Not animation-heavy
- ❌ Not a button styling library
- ❌ Not a retry framework
- ❌ Not auto-magic error handling

---

## Core Concepts

### ActionState

An enum representing the lifecycle of an async action:

- idle
- loading
- success
- error

Do not add new states unless absolutely required.

---

## Public API Rules

- All public APIs must live in `lib/action_button.dart`
- Implementation details must stay inside `lib/src/`
- Do not expose internal controllers unless justified
- Prefer builder-based APIs over inheritance

Example public API shape:

```dart
ActionButton(
  onPressed: () async {},
  builder: (context, state) => Widget,
);
```

Async Behavior Rules

Ignore button presses while already in loading state

Never allow concurrent executions

Errors must be explicitly handled

State transitions must be deterministic

Avoid silent failures

Code Style Guidelines

Follow Flutter/Dart style conventions

Prefer readable code over compact code

Avoid deeply nested logic

Keep functions short and testable

Use meaningful variable names

Documentation Expectations

When generating code:

Add brief comments for non-obvious logic

Avoid redundant comments

Assume the reader is an intermediate Flutter developer

Testing & Examples

Ensure example usage exists under /example

Examples must demonstrate a realistic async flow

Do not include fake or misleading patterns

Scope Control (VERY IMPORTANT)

If a feature request:

Adds configuration complexity

Adds styling opinion

Adds animation behavior

Adds retry / debounce / queue logic

➡️ Do NOT implement it unless explicitly requested.

Interview Readiness

All code should be:

Easy to explain in an interview

Justifiable in terms of design decisions

Defensible against “why not just do X?” questions

When in doubt, choose simplicity and explicitness.

Summary

This package exists to:

Reduce boilerplate and bugs when handling async actions in buttons.

Nothing more. Nothing less.

---

## Why This Is a Very Good Move

This file:

- Keeps Copilot **on-scope**
- Prevents feature creep
- Forces logic-first suggestions
- Signals **engineering maturity** if someone views your repo
- Helps you stay interview-ready while coding

Very few junior candidates do this — it’s a subtle but strong signal.

---

## Next Steps (Recommended)

Next, I can help you:

1. Create a **Copilot-friendly file structure**
2. Write the **initial `ActionButton` implementation**
3. Review Copilot-generated code for **anti-patterns**
4. Prepare a **pub.dev publish checklist**

Tell me what you want to do next.
