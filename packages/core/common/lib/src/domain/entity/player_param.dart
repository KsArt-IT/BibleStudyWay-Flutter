enum PlayerWindowState { minimal, expanded, fullscreen }

class PlayerParam {
  final double minHeight;
  final double maxHeight;
  final double currentHeight;
  final bool isAnimating;

  final bool isExpanded;
  final bool isFullScreen;
  final bool isMinimal;

  // Параметри перетягування
  final bool isDragging; // Активне перетягування
  final double dragStartY; // Початкова позиція перетягування
  final double dragVelocity; // Швидкість перетягування

  const PlayerParam({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.isAnimating,

    required this.isExpanded,
    required this.isFullScreen,
    required this.isMinimal,

    required this.isDragging,
    required this.dragStartY,
    required this.dragVelocity,
  });

  const PlayerParam.initial()
    : this(
        currentHeight: 0.0,
        minHeight: 0.0,
        maxHeight: 0.0,
        isAnimating: false,

        isExpanded: false,
        isFullScreen: false,
        isMinimal: false,

        isDragging: false,
        dragStartY: 0.0,
        dragVelocity: 0.0,
      );

  PlayerParam copyWith({
    double? currentHeight,
    double? minHeight,
    double? maxHeight,
    bool? isAnimating,
    bool? isExpanded,
    bool? isFullScreen,
    bool? isMinimal,
    bool? isDragging,
    double? dragStartY,
    double? dragVelocity,
  }) => PlayerParam(
    currentHeight: currentHeight ?? this.currentHeight,
    minHeight: minHeight ?? this.minHeight,
    maxHeight: maxHeight ?? this.maxHeight,
    isAnimating: isAnimating ?? this.isAnimating,
    isExpanded: isExpanded ?? this.isExpanded,
    isFullScreen: isFullScreen ?? this.isFullScreen,
    isMinimal: isMinimal ?? this.isMinimal,
    isDragging: isDragging ?? this.isDragging,
    dragStartY: dragStartY ?? this.dragStartY,
    dragVelocity: dragVelocity ?? this.dragVelocity,
  );

  /// Визначає поточний стан вікна на основі висоти
  PlayerWindowState get currentWindowState {
    if (isFullScreen) return PlayerWindowState.fullscreen;
    if (isExpanded) return PlayerWindowState.expanded;
    return PlayerWindowState.minimal;
  }

  /// Визначає стан вікна на основі поточної висоти
  static PlayerWindowState determineStateByHeight(
    double height,
    double minHeight,
    double maxHeight,
  ) {
    if (height <= minHeight * 1.2) return PlayerWindowState.minimal;
    if (height <= maxHeight * 1.2) return PlayerWindowState.expanded;
    return PlayerWindowState.fullscreen;
  }

  /// Повертає висоту для зазначеного стану
  static double getHeightForState(PlayerWindowState state, double minHeight, double maxHeight) =>
      switch (state) {
        PlayerWindowState.minimal => minHeight,
        PlayerWindowState.expanded => maxHeight,
        PlayerWindowState.fullscreen => double.infinity,
      };

  /// Створює новий PlayerParam із оновленим станом на основі висоти
  PlayerParam updateStateByHeight() {
    final newState = determineStateByHeight(currentHeight, minHeight, maxHeight);
    return copyWith(
      isMinimal: newState == PlayerWindowState.minimal,
      isExpanded: newState == PlayerWindowState.expanded,
      isFullScreen: newState == PlayerWindowState.fullscreen,
    );
  }
}
