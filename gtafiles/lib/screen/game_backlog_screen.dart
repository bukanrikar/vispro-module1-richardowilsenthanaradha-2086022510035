import 'package:flutter/material.dart';
import '../models/game.dart';
import '../state/game_backlog_state.dart';
import '../widgets/add_game_button.dart';
import '../widgets/game_list.dart';
import '../widgets/status_filter_chips.dart';

class GameBacklogScreen extends StatefulWidget {
  const GameBacklogScreen({super.key});
  @override
  State<GameBacklogScreen> createState() => _GameBacklogScreenState();
}
class _GameBacklogScreenState extends State<GameBacklogScreen> {
  final GameBacklogState _state = GameBacklogState();
  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }
  void _showAddDialog() {
    final controller = TextEditingController();
    GameStatus selectedStatus = GameStatus.backlog;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tambah Game'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Judul Game'),
            ),
            const SizedBox(height: 12),
            DropdownButton<GameStatus>(
              value: selectedStatus,
              isExpanded: true,
              items: GameStatus.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (v) => selectedStatus = v!,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _state.addGame(controller.text.trim(), selectedStatus);
              }
              Navigator.pop(ctx);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Game Backlog'),
      ),
      body: AnimatedBuilder(
        animation: _state,
        builder: (context, _) {
          return Column(
            children: [
              StatusFilterChips(
                selected: _state.filterStatus,
                onSelected: _state.setFilter,
              ),
              Expanded(
                child: GameList(
                  games: _state.games,
                  onStatusChanged: _state.updateStatus,
                  onDelete: _state.removeGame,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: AddGameButton(onPressed: _showAddDialog),
    );
  }
}