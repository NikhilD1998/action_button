import 'package:action_button/action_button.dart';
import 'package:example/state_child_helper.dart';
import 'package:flutter/material.dart';

class NeumorphicActionButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final Color? color;
  final Color? shadowColor;

  const NeumorphicActionButton({
    super.key,
    required this.onPressed,
    this.color,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = color ?? Colors.grey[200]!;
    final Color shadow = shadowColor ?? Colors.grey[400]!;

    return ActionButton(
      onPressed: onPressed,
      builder: (context, state) {
        return Material(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
          elevation: state == ActionState.success ? 8 : 4,
          shadowColor: shadow,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 160,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: state == ActionState.error
                    ? Colors.red
                    : Colors.grey[300]!,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  offset: const Offset(2, 2),
                  blurRadius: 6,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2, -2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Center(child: buildStateChild(state, 'Neumorphic')),
          ),
        );
      },
    );
  }
}
