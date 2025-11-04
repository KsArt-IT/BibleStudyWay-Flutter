import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/src/presentation/screens/video_player/cubit/video_player_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerBuilder extends StatelessWidget {
  const VideoPlayerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        context.read<VideoPlayerCubit>().setFullScreen(false);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: colors.primary,
        topActions: <Widget>[
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.white, size: AppDimens.inset4x),
            onPressed: () {},
          ),
        ],
        onReady: () {
          log('onReady', name: 'VideoPlayerBuilder');
          _isPlayerReady = true;
          // Set video parameters after player is ready
          _setVideoParameters();
        },
        onEnded: (data) => _onNext(),
      ),
      builder: (context, player) {
        return BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
          listener: (context, state) {
            if (state.playbackState.youtubeId != _playbackState.youtubeId) {
              _playbackState = state.playbackState;
              _onLoad();
            }
          },
          builder: (context, state) {
            return DraggableVideoPlayer(
              player: player,
              isPlaying: _controller.value.isPlaying,
              isPlayerReady: _isPlayerReady,
              muted: _muted,
              volume: _volume,
              fullScreenButton: _fullScreenButton,
              onPlayOrPause: _onPlayOrPause,
              onMuted: _onMuted,
              onVolume: _onVolume,
              onNext: _onNext,
              onPrevious: _onPrevious,
            );
          },
        );
      },
    );
  }
}
