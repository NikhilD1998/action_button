<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# action_button

A production-ready async action button abstraction for Flutter.

---

## Purpose

**action_button** provides a reusable, UI-agnostic widget to standardize async button behavior in Flutter apps:

- Prevents double taps and concurrent executions
- Manages explicit states: `idle`, `loading`, `success`, `error`
- Uses a builder pattern for full UI flexibility
- Keeps your UI logic clean and bug-free

This package is **not** a UI kit or design system.  
It focuses on **behavior and correctness**, not styling.

---

## Features

- Explicit state management for async actions
- Safe abstraction that prevents double taps
- Deterministic state transitions
- UI-agnostic via a builder pattern
- Small, predictable, and stable API

---

## Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  action_button: ^<latest_version>
```

Import in your Dart code:

```dart
import 'package:action_button/action_button.dart';
```

---

## Usage

```dart
ActionButton(
  onPressed: () async {
    // Your async logic here
  },
  builder: (context, state) {
    switch (state) {
      case ActionState.idle:
        return ElevatedButton(onPressed: null, child: Text('Tap Me'));
      case ActionState.loading:
        return CircularProgressIndicator();
      case ActionState.success:
        return Icon(Icons.check, color: Colors.green);
      case ActionState.error:
        return Icon(Icons.error, color: Colors.red);
    }
  },
)
```

See the `/example` folder for realistic async flows and custom button styles.

---

## API

- **ActionButton** — Main widget for async actions.
- **ActionState** — Enum representing the button state (`idle`, `loading`, `success`, `error`).

---

## Design Principles

- Favor explicit state management over magic behavior
- Avoid over-engineering and feature creep
- Public APIs are small, predictable, and stable
- Internal logic is easy to reason about in interviews
- No styling, animation, retry, debounce, or queue logic

---

## Example

See `/example` for:

- Neumorphic, Glassmorphic, and Gradient button styles
- How to provide your own colors and gradients
- Realistic async flows

---

## Additional Information

- [API Documentation](https://pub.dev/documentation/action_button/latest/)
- Issues and contributions welcome via [GitHub Issues](https://github.com/your-repo/action_button/issues)
- Licensed under MIT

---

## Why use action_button?

This package exists to:

- Reduce boilerplate and bugs when handling async actions in buttons.
- Help you write safer, more maintainable Flutter code.
- Keep your UI logic clean and interview-ready.

Nothing more. Nothing less.
