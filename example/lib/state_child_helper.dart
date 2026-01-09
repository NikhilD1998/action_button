import 'package:flutter/material.dart';
import 'package:action_button/action_button.dart';

Widget buildStateChild(ActionState state, String label) {
  switch (state) {
    case ActionState.idle:
      return Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
      );
    case ActionState.loading:
      return const SizedBox(
        width: 26,
        height: 26,
        child: CircularProgressIndicator(strokeWidth: 2.2),
      );
    case ActionState.success:
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check_circle, color: Colors.green, size: 22),
          SizedBox(width: 8),
          Text(
            'Success',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ],
      );
    case ActionState.error:
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.error, color: Colors.red, size: 22),
          SizedBox(width: 8),
          Text(
            'Error',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      );
  }
}
