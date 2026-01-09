import 'dart:ui';

import 'package:action_button/action_button.dart';
import 'package:example/state_child_helper.dart';
import 'package:flutter/material.dart';

class GlassmorphicActionButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final List<Color>? gradient;

  const GlassmorphicActionButton({
    super.key,
    required this.onPressed,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    // Use .withAlpha for compatibility with latest Flutter SDKs
    final List<Color> grad =
        gradient ??
        [
          Colors.white.withAlpha((0.25 * 255).toInt()),
          Colors.white.withAlpha((0.05 * 255).toInt()),
        ];

    return ActionButton(
      onPressed: onPressed,
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          elevation: 0,
          child: Container(
            width: 160,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: grad,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: state == ActionState.error
                    ? Colors.red.withAlpha((0.7 * 255).toInt())
                    : Colors.white.withAlpha((0.4 * 255).toInt()),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha((0.25 * 255).toInt()),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Center(child: buildStateChild(state, 'Glassmorphic')),
              ),
            ),
          ),
        );
      },
    );
  }
}
