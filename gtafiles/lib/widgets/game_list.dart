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
        return GameListItem(
          game: game,
          onStatusChanged: (status) => onStatusChanged(game.id, status),
          onDelete: () => onDelete(game.id),
        );
      },
    );
  }
}