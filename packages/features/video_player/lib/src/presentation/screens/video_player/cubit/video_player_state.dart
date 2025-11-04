part of 'video_player_cubit.dart';

class VideoPlayerState {
  final PlaybackState playbackState;
  final PlayerParam playerParam;

  final StateStatus status;

  const VideoPlayerState({
    required this.playbackState,
    required this.playerParam,
    required this.status,
  });

  factory VideoPlayerState.initial() => VideoPlayerState(
    playbackState: PlaybackState.initial(),
    playerParam: PlayerParam.initial(),
    status: StateStatus.initial,
  );

  VideoPlayerState copyWith({
    PlaybackState? playbackState,
    PlayerParam? playerParam,
    StateStatus? status,
  }) => VideoPlayerState(
    playbackState: playbackState ?? this.playbackState,
    playerParam: playerParam ?? this.playerParam,
    status: status ?? this.status,
  );
}
