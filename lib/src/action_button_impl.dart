import 'package:flutter/widgets.dart';

/// Explicit states for async action lifecycle.
enum ActionState { idle, loading, success, error }

typedef ActionButtonBuilder =
    Widget Function(BuildContext context, ActionState state);

class ActionButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final ActionButtonBuilder builder;

  const ActionButton({
    super.key,
    required this.onPressed,
    required this.builder,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  ActionState _state = ActionState.idle;

  Future<void> _handlePress() async {
    if (_state == ActionState.loading) return; // Prevent double taps
    setState(() => _state = ActionState.loading);

    try {
      await widget.onPressed();
      setState(() => _state = ActionState.success);
    } catch (_) {
      setState(() => _state = ActionState.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _state == ActionState.loading ? null : _handlePress,
      child: widget.builder(context, _state),
    );
  }
}
