import 'package:flutter/material.dart';
import '../models/game.dart';

class GameListItem extends StatelessWidget {
  final Game game;
  final ValueChanged<GameStatus> onStatusChanged;
  final VoidCallback onDelete;
  const GameListItem({
    super.key,
    required this.game,
    required this.onStatusChanged,
    required this.onDelete,
  });
  Color _statusColor(BuildContext context) {
    switch (game.status) {
      case GameStatus.playing:
        return Colors.blue;
      case GameStatus.finished:
        return Colors.green;
      case GameStatus.dropped:
        return Colors.red;
      case GameStatus.backlog:
        return Colors.orange;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _statusColor(context),
          child: Text(game.title[0].toUpperCase()),
        ),
        title: Text(game.title),
        subtitle: Text(game.status.name),
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
        onLongPress: onDelete,
      ),
    );
  }
}