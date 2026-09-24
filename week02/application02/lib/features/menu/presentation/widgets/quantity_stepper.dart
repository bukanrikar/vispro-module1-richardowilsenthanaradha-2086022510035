import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: quantity == 0 ? null : onDecrement,
          icon: const Icon(Icons.remove_circle_outline),
        ),
        SizedBox(
          width: 28,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          onPressed: quantity >= 99 ? null : onIncrement,
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}
