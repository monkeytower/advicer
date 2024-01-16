import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.error_outline, size: 40, color: themeData.colorScheme.error),
      const SizedBox(height: 30),
      Text(
        message,
        textAlign: TextAlign.center,
        style: themeData.textTheme.headlineLarge?.copyWith(
          color: themeData.colorScheme.error,
        ),
      ),
    ]);
  }
}
