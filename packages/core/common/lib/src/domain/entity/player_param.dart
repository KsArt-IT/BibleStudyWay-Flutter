class PlayerParam {
  final double minHeight;
  final double maxHeight;
  final double currentHeight;
  final bool isAnimating;
  
  final bool isExpanded;
  final bool isFullScreen;
  final bool isMinimal;

  const PlayerParam({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.isAnimating,
  
    required this.isExpanded,
    required this.isFullScreen,
    required this.isMinimal,
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
      );

  PlayerParam copyWith({
    double? currentHeight,
    double? minHeight,
    double? maxHeight,
    bool? isAnimating,
    bool? isExpanded,
    bool? isFullScreen,
    bool? isMinimal,
  }) => PlayerParam(
    currentHeight: currentHeight ?? this.currentHeight,
    minHeight: minHeight ?? this.minHeight,
    maxHeight: maxHeight ?? this.maxHeight,
    isAnimating: isAnimating ?? this.isAnimating,
    isExpanded: isExpanded ?? this.isExpanded,
    isFullScreen: isFullScreen ?? this.isFullScreen,
    isMinimal: isMinimal ?? this.isMinimal,
  );
}
