import 'package:example/glassmorphic_action_button.dart';
import 'package:example/gradient_action_button.dart';
import 'package:example/neumorphic_action_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: ExampleScreen());
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  Future<void> _fakeAsyncAction() async {
    await Future.delayed(const Duration(seconds: 2));
    //throw Exception('Fail'); // Uncomment to test error state
  }

  @override
  Widget build(BuildContext context) {
    // Example: user can provide their own colors here
    final neumorphicColor = Colors.grey[100];
    final neumorphicShadow = Colors.grey[400];
    final glassGradient = [
      Colors.white.withAlpha((0.25 * 255).toInt()),
      Colors.white.withAlpha((0.05 * 255).toInt()),
    ];
    final gradientIdle = [Colors.blue, Colors.white];
    final gradientSuccess = [Colors.green, Colors.lightGreen];

    return Scaffold(
      appBar: AppBar(title: const Text('ActionButton Styles Example')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 500;
                final children = [
                  // Neumorphic-like Button
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: NeumorphicActionButton(
                      onPressed: _fakeAsyncAction,
                      color: neumorphicColor,
                      shadowColor: neumorphicShadow,
                    ),
                  ),
                  // Glassmorphic-like Button
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GlassmorphicActionButton(
                      onPressed: _fakeAsyncAction,
                      gradient: glassGradient,
                    ),
                  ),
                  // Gradient Button
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GradientActionButton(
                      onPressed: _fakeAsyncAction,
                      idleGradient: gradientIdle,
                      successGradient: gradientSuccess,
                    ),
                  ),
                ];

                return isWide
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
