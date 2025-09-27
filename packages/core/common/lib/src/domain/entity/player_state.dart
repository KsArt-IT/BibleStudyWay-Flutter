import 'package:core_common/src/domain/entity/collection_type.dart';
import 'package:core_common/src/domain/entity/player_status.dart';

class PlaybackState {
  final CollectionType collectionType;
  final String title;
  final String youtubeId;
  final int position;
  final String tag;
  final String id;
  final int beginningAt;
  final int startAt;
  final int endAt;
  final int endingAt;
  final double playbackRate;
  final String text;

  final PlayerStatus status;

  const PlaybackState({
    required this.collectionType,
    required this.title,
    required this.youtubeId,
    required this.position,
    required this.tag,
    required this.id,
    required this.beginningAt,
    required this.startAt,
    required this.endAt,
    required this.endingAt,
    required this.playbackRate,
    required this.text,
    required this.status,
  });

  factory PlaybackState.initial({
    CollectionType collectionType = CollectionType.lectures,
    String title = '',
    String youtubeId = '',
    int position = 0,
    String tag = '',
    String id = '',
    int beginningAt = 0,
    int startAt = 0,
    int endAt = 0,
    int endingAt = 0,

    double playbackRate = 1.0,

    String text = '',

    PlayerStatus status = PlayerStatus.initial,
  }) => PlaybackState(
    collectionType: collectionType,
    title: title,
    youtubeId: youtubeId,
    position: position,
    tag: tag,
    id: id,
    beginningAt: beginningAt,
    startAt: startAt,
    endAt: endAt,
    endingAt: endingAt,
    playbackRate: playbackRate,
    text: text,
    status: status,
  );

  PlaybackState copyWith({
    CollectionType? collectionType,
    String? title,
    String? youtubeId,
    int? position,
    String? tag,
    String? id,
    int? beginningAt,
    int? startAt,
    int? endAt,
    int? endingAt,
    double? playbackRate,
    String? text,
    PlayerStatus? status,
  }) => PlaybackState(
    collectionType: collectionType ?? this.collectionType,
    title: title ?? this.title,
    youtubeId: youtubeId ?? this.youtubeId,
    position: position ?? this.position,
    tag: tag ?? this.tag,
    id: id ?? this.id,
    beginningAt: beginningAt ?? this.beginningAt,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
    endingAt: endingAt ?? this.endingAt,
    playbackRate: playbackRate ?? this.playbackRate,
    text: text ?? this.text,
    status: status ?? this.status,
  );
}
