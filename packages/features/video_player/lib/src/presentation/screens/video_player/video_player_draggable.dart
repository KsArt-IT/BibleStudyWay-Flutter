class DraggableVideoPlayer extends StatefulWidget {
  const DraggableVideoPlayer({
    super.key,
    required this.player,
    required this.isPlaying,
    required this.isPlayerReady,
    required this.muted,
    required this.volume,
    required this.fullScreenButton,
    required this.onPlayOrPause,
    required this.onMuted,
    required this.onVolume,
    required this.onNext,
    required this.onPrevious,
  });

  final Widget player;
  final bool isPlaying;
  final bool isPlayerReady;
  final bool muted;
  final double volume;
  final FullScreenButton fullScreenButton;
  final VoidCallback onPlayOrPause;
  final VoidCallback onMuted;
  final ValueChanged<double> onVolume;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  State<DraggableVideoPlayer> createState() => _DraggableVideoPlayerState();
}

class _DraggableVideoPlayerState extends State<DraggableVideoPlayer> with TickerProviderStateMixin {
  late AnimationController _animationController;

  double _dragStartHeight = 0.0;
  double _dragOffset = 0.0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize player dimensions on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<VideoPlayerCubit>();
      if (cubit.state.minHeight == 0.0) {
        final screenHeight = MediaQuery.of(context).size.height;
        final minHeight = 100.0.h;
        cubit.initializePlayer(screenHeight: screenHeight, minHeight: minHeight);
      }
    });
  }

  void _onDragStart(DragStartDetails details) {
    if (context.read<VideoPlayerCubit>().state.isAnimating) return;

    setState(() {
      _isDragging = true;
      _dragStartHeight = context.read<VideoPlayerCubit>().state.currentHeight;
      _dragOffset = 0.0;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;

    _dragOffset -= details.delta.dy; // Accumulate the drag offset
    final newHeight = _dragStartHeight + _dragOffset;

    context.read<VideoPlayerCubit>().updateHeight(newHeight);
  }

  void _onDragEnd(DragEndDetails details) {
    if (!_isDragging) return;

    setState(() {
      _isDragging = false;
      _dragOffset = 0.0;
    });

    context.read<VideoPlayerCubit>().completeDrag();
  }

  void _onDragHandleTap() {
    context.read<VideoPlayerCubit>().toggleExpanded();
  }

  BorderRadius _getRadius() {
    if (_dragOffset < 0) {
      final radius = _dragOffset.abs() / 10;
      if (radius < AppDimens.radius4x) {
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        );
      }
    }
    return BorderRadius.only(
      topLeft: Radius.circular(AppDimens.radius4x),
      topRight: Radius.circular(AppDimens.radius4x),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        // Update animation controller based on expanded state
        if (state.expanded && !_animationController.isCompleted) {
          _animationController.forward();
        } else if (!state.expanded && !_animationController.isDismissed) {
          _animationController.reverse();
        }

        return SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: _onDragStart,
            onPanUpdate: _onDragUpdate,
            onPanEnd: _onDragEnd,
            child: AnimatedContainer(
              duration: (state.isAnimating && !_isDragging)
                  ? const Duration(milliseconds: 300)
                  : Duration.zero,
              curve: Curves.easeInOut,
              height: state.currentHeight,
              child: AppContainer(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                type: AppContainerType.outlined,
                border: Border.all(
                  color: context.colors.primary.withAlpha(AppConstants.alpha30),
                  width: 1.5,
                ),
                borderRadius: state.expanded
                    ? _isDragging
                          ? _getRadius()
                          : null
                    : BorderRadius.only(
                        topLeft: Radius.circular(AppDimens.radius4x),
                        topRight: Radius.circular(AppDimens.radius4x),
                      ),
                child: Column(
                  children: [
                    // Drag handle
                    DragHandle(onTap: _onDragHandleTap),

                    // Video player content
                    if (state.expanded)
                      VideoPlayerControlExpanded(
                        title: state.playbackState.title,
                        player: widget.player,
                        isPlaying: widget.isPlaying,
                        isPlayerReady: widget.isPlayerReady,
                        muted: widget.muted,
                        volume: widget.volume,
                        fullScreenButton: widget.fullScreenButton,
                        onPlayOrPause: widget.onPlayOrPause,
                        onMuted: widget.onMuted,
                        onVolume: widget.onVolume,
                        onNext: widget.onNext,
                        onPrevious: widget.onPrevious,
                      )
                    else
                      VideoPlayerControl(
                        title: state.playbackState.title,
                        player: widget.player,
                        isPlaying: widget.isPlaying,
                        isPlayerReady: widget.isPlayerReady,
                        muted: widget.muted,
                        volume: widget.volume,
                        fullScreenButton: widget.fullScreenButton,
                        onPlayOrPause: widget.onPlayOrPause,
                        onMuted: widget.onMuted,
                        onVolume: widget.onVolume,
                        onNext: widget.onNext,
                        onPrevious: widget.onPrevious,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
