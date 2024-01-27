import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed;
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
