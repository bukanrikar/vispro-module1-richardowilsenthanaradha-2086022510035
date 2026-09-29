import 'package:flutter/material.dart';
class AddGameButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddGameButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}