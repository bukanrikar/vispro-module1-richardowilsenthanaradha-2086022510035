import 'package:flutter/material.dart';
import '../models/game.dart';
import 'game_list_item.dart';

class GameList extends StatelessWidget {
  final List<Game> games;
  final void Function(String id, GameStatus status) onStatusChanged;
  final ValueChanged<String> onDelete;

  const GameList({
    super.key,
    required this.games,
    required this.onStatusChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const Center(
        child: Text('Belum ada game. Tambahkan sekarang!'),
      );
    }

    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];

        return Dismissible(
          key: ValueKey(game.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => onDelete(game.id),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24),
            color: Theme.of(context).colorScheme.errorContainer,
            child: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
          child: GameListItem(
            game: game,
            onStatusChanged: (status) => onStatusChanged(game.id, status),
          ),
        );
      },
    );
  }
}