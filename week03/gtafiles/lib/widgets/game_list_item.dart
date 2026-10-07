import 'package:flutter/material.dart';
import '../models/game.dart';
import '../theme/app_theme.dart';

class GameListItem extends StatelessWidget {
  final Game game;
  final ValueChanged<GameStatus> onStatusChanged;

  const GameListItem({
    super.key,
    required this.game,
    required this.onStatusChanged,
  });

  Color _statusColor(BuildContext context) {
    return Theme.of(context)
        .extension<GameStatusColors>()!
        .forStatus(game.status);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _statusColor(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor,
          foregroundColor: theme.colorScheme.onPrimary,
          child: Text(game.title[0].toUpperCase()),
        ),
        title: Text(
          game.title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
        subtitle: Text(
          game.status.name.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: statusColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
          ),
        ),
        trailing: PopupMenuButton<GameStatus>(
          onSelected: onStatusChanged,
          itemBuilder: (context) {
            return GameStatus.values.map((status) {
              return PopupMenuItem(
                value: status,
                child: Text(status.name),
              );
            }).toList();
          },
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}