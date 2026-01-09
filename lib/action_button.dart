/// # action_button
///
/// A production-ready async action button abstraction for Flutter.
///
/// ## Purpose
/// Provides a reusable, UI-agnostic widget to standardize async button behavior:
/// - Prevents double taps
/// - Manages explicit states: idle, loading, success, error
/// - Uses a builder pattern for full UI flexibility
///
/// ## Usage
/// ```dart
/// ActionButton(
///   onPressed: () async {
///     // Your async logic here
///   },
///   builder: (context, state) {
///     switch (state) {
///       case ActionState.idle:
///         return ElevatedButton(onPressed: null, child: Text('Tap Me'));
///       case ActionState.loading:
///         return CircularProgressIndicator();
///       case ActionState.success:
///         return Icon(Icons.check, color: Colors.green);
///       case ActionState.error:
///         return Icon(Icons.error, color: Colors.red);
///     }
///   },
/// )
/// ```
///
/// ## API
/// - [ActionButton] — Main widget for async actions.
/// - [ActionState] — Enum representing the button state.
///
/// See `/example` for realistic usage.
///
/// ---
///
/// ## Design Principles
/// - Explicit state management
/// - No styling or animation opinions
/// - No retry, debounce, or queue logic
/// - Small, predictable, and stable API
///
/// ---
///
/// ## Exports
library action_button;

export 'src/action_button_impl.dart' show ActionButton, ActionState;
