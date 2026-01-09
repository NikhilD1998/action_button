import 'package:flutter/material.dart';
import 'package:action_button/action_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(home: ExampleScreen());
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  Future<void> _fakeAsyncAction() async {
    await Future.delayed(const Duration(seconds: 2));
    // throw Exception('Fail'); // Uncomment to test error state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActionButton(
          onPressed: _fakeAsyncAction,
          builder: (context, state) {
            switch (state) {
              case ActionState.idle:
                return ElevatedButton(
                  onPressed: null,
                  child: const Text('Tap Me'),
                );
              case ActionState.loading:
                return const CircularProgressIndicator();
              case ActionState.success:
                return const Icon(Icons.check, color: Colors.green);
              case ActionState.error:
                return const Icon(Icons.error, color: Colors.red);
            }
          },
        ),
      ),
    );
  }
}
