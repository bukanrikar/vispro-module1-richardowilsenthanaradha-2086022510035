import 'package:flutter/material.dart';
import '../models/game.dart';

class StatusFilterChips extends StatelessWidget {
  final GameStatus? selected;
  final ValueChanged<GameStatus?> onSelected;
  const StatusFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          FilterChip(
            label: const Text('Semua'),
            selected: selected == null,
            onSelected: (_) => onSelected(null),
          ),
          ...GameStatus.values.map((status) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FilterChip(
                label: Text(status.name),
                selected: selected == status,
                onSelected: (_) => onSelected(status),
              ),
            );
          }),
        ],
      ),
    );
  }
}