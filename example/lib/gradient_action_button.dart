import 'package:action_button/action_button.dart';
import 'package:example/state_child_helper.dart';
import 'package:flutter/material.dart';

class GradientActionButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final List<Color>? idleGradient;
  final List<Color>? successGradient;

  const GradientActionButton({
    super.key,
    required this.onPressed,
    this.idleGradient,
    this.successGradient,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> idle = idleGradient ?? [Colors.blue, Colors.purple];
    final List<Color> success =
        successGradient ?? [Colors.green, Colors.lightGreen];

    return ActionButton(
      onPressed: onPressed,
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          elevation: state == ActionState.success ? 8 : 4,
          child: Container(
            width: 160,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: state == ActionState.success ? success : idle,
              ),
              border: Border.all(
                color: state == ActionState.error
                    ? Colors.red
                    : Colors.transparent,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  // Use withAlpha for compatibility with latest Flutter SDKs
                  color: Colors.purple.withAlpha((0.18 * 255).toInt()),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(child: buildStateChild(state, 'Gradient')),
          ),
        );
      },
    );
  }
}
