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
    final List<Color> grad =
        gradient ??
        [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.05)];

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
                    ? Colors.red.withOpacity(0.7)
                    : Colors.white.withOpacity(0.4),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.08),
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
