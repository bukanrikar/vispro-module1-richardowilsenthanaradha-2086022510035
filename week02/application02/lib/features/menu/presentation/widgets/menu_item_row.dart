import 'package:flutter/material.dart';
import '../../../../lab02_start.dart';
import 'quantity_stepper.dart';

class MenuItemRow extends StatelessWidget {
  final MenuItem item;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MenuItemRow({
    super.key,
    required this.item,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (item.promo) const SizedBox(width: 6),
                      if (item.promo)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'PROMO',
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Rp ${item.price}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QuantityStepper(
              quantity: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ),
    );
  }
}
