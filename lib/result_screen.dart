import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class ResultScreen extends StatelessWidget {
  /// Constructs a [ResultScreen]
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/take_picture'),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}
