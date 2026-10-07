import 'package:flutter/material.dart';
import '../models/game.dart';

@immutable
class GameStatusColors extends ThemeExtension<GameStatusColors> {
  final Color playing;
  final Color finished;
  final Color dropped;
  final Color backlog;

  const GameStatusColors({
    required this.playing,
    required this.finished,
    required this.dropped,
    required this.backlog,
  });

  Color forStatus(GameStatus status) {
    switch (status) {
      case GameStatus.playing:
        return playing;
      case GameStatus.finished:
        return finished;
      case GameStatus.dropped:
        return dropped;
      case GameStatus.backlog:
        return backlog;
    }
  }

  @override
  GameStatusColors copyWith({
    Color? playing,
    Color? finished,
    Color? dropped,
    Color? backlog,
  }) {
    return GameStatusColors(
      playing: playing ?? this.playing,
      finished: finished ?? this.finished,
      dropped: dropped ?? this.dropped,
      backlog: backlog ?? this.backlog,
    );
  }

  @override
  GameStatusColors lerp(ThemeExtension<GameStatusColors>? other, double t) {
    if (other is! GameStatusColors) return this;
    return GameStatusColors(
      playing: Color.lerp(playing, other.playing, t)!,
      finished: Color.lerp(finished, other.finished, t)!,
      dropped: Color.lerp(dropped, other.dropped, t)!,
      backlog: Color.lerp(backlog, other.backlog, t)!,
    );
  }
}

class AppTheme {
  static const Color seedColor = Color(0xFF000000);
  static const DynamicSchemeVariant _variant =
      DynamicSchemeVariant.monochrome;

  static ThemeData light() {
    return _build(
      ColorScheme.fromSeed(
        seedColor: seedColor,
        dynamicSchemeVariant: _variant,
      ),
    );
  }

  static ThemeData dark() {
    return _build(
      ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
        dynamicSchemeVariant: _variant,
      ),
    );
  }

  static ThemeData _build(ColorScheme scheme) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
    );
    final textTheme = base.textTheme;

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 2,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        color: scheme.surfaceContainerLow,
      ),
      chipTheme: ChipThemeData(
        showCheckmark: false,
        selectedColor: scheme.primaryContainer,
        backgroundColor: scheme.surfaceContainerHighest,
        labelStyle: textTheme.labelLarge?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: scheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        GameStatusColors(
          playing: Color(0xFF1565C0),
          finished: Color(0xFF2E7D32),
          dropped: Color(0xFFC62828),
          backlog: Color(0xFFEF6C00),
        ),
      ],
    );
  }
}