enum GameStatus { playing, finished, dropped, backlog }

class Game {
  final String id;
  final String title;
  final GameStatus status;

  const Game({
    required this.id,
    required this.title,
    required this.status,
  });

  Game copyWith({String? title, GameStatus? status}) {
    return Game(
      id: id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }
}