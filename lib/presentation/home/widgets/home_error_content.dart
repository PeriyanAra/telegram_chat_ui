import 'package:flutter/material.dart';

class HomeErrorContent extends StatelessWidget {
  final String errorMessage;

  const HomeErrorContent({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
