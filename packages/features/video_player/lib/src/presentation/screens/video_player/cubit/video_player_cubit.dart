import 'package:bloc/bloc.dart';
import 'package:core_common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
late final YoutubePlayerController controller;
  DateTime? lastUpdate;
  static const updateSeconds = 60;

  VideoPlayerCubit() : super(VideoPlayerState.initial()) {
    controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
          final playbackRate = controller.value.playbackRate;
      final position = controller.value.position.inSeconds;
    final playbackState = state.playbackState;
    final status = state.playbackState.endAt > 0 && position >= state.playbackState.endAt 
    ? PlayerStatus.done 
    : position >= state.playbackState.startAt && isNeedUpdate() 
    ? PlayerStatus.position : state.playbackState.status;
    emit(state.copyWith(playbackState: playbackState.copyWith(status: status)));
  }

bool isNeedUpdate() {
    final now = DateTime.now();
    // Check if enough time has passed since the last update.
    if (lastUpdate != null && now.difference(lastUpdate!).inSeconds < updateSeconds) {
      return false;
    }
    // Update last update time
    lastUpdate = now;
    return true;
}

  void loadPlaylist(List<String> playlist, {int startIndex = 0}) {
    emit(PlayerState(playlist: playlist, currentIndex: startIndex, isPlaying: true));
    controller.load(playlist[startIndex]);
  }

  void next() {
    if (state.currentIndex < state.playlist.length - 1) {
      final nextIndex = state.currentIndex + 1;
      emit(state.copyWith(currentIndex: nextIndex));
      controller.load(state.playlist[nextIndex]);
    }
  }

  void previous() {
    if (state.currentIndex > 0) {
      final prevIndex = state.currentIndex - 1;
      emit(state.copyWith(currentIndex: prevIndex));
      controller.load(state.playlist[prevIndex]);
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}