import 'package:flutter/foundation.dart';
import '../models/game.dart';

class GameBacklogState extends ChangeNotifier {
  final List<Game> _games = [];
  GameStatus? _filterStatus;
  List<Game> get games {
    if (_filterStatus == null) return List.unmodifiable(_games);
    return _games.where((g) => g.status == _filterStatus).toList();
  }
  GameStatus? get filterStatus => _filterStatus;
  void addGame(String title, GameStatus status) {
    _games.add(Game(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      status: status,
    ));
    notifyListeners();
  }
  void removeGame(String id) {
    _games.removeWhere((g) => g.id == id);
    notifyListeners();
  }
  void updateStatus(String id, GameStatus newStatus) {
    final index = _games.indexWhere((g) => g.id == id);
    if (index != -1) {
      _games[index] = _games[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }
  void setFilter(GameStatus? status) {
    _filterStatus = status;
    notifyListeners();
  }
}