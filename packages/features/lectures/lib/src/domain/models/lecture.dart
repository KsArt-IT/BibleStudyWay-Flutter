import 'package:flutter/widgets.dart';

/// Immutable model representing a lecture entity.
@immutable
class Lecture {
  const Lecture({
    required this.id,
    required this.title,
    required this.description,
    required this.lecturer, // lecturer name
    required this.number, // lecture number in section
    required this.level, // lecture level
    required this.youtubeId, // youtube video id
    required this.tag, // for filtering section education
    required this.cat, // for filtering category
    this.beginningAt = 0, // in seconds, start of the video, parameter, can be skipped
    this.startAt = 0, // in seconds, start of the lecture
    this.endAt = 0, // in seconds, end of the lecture
    this.endingAt = 0, // in seconds, end of the video, can be skipped
    this.image,
  });

  final String id;
  final String title;
  final String description;
  final String lecturer;
  final int number;
  final int level;
  final String youtubeId;
  final String tag;
  final String cat;
  final int beginningAt;
  final int startAt;
  final int endAt;
  final int endingAt;
  final String? image;

  Lecture copyWith({
    String? id,
    String? title,
    String? description,
    String? lecturer,
    int? number,
    int? level,
    String? youtubeId,
    String? tag,
    String? cat,
    int? beginningAt,
    int? startAt,
    int? endAt,
    int? endingAt,
    String? image,
  }) => Lecture(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    lecturer: lecturer ?? this.lecturer,
    number: number ?? this.number,
    level: level ?? this.level,
    youtubeId: youtubeId ?? this.youtubeId,
    tag: tag ?? this.tag,
    cat: cat ?? this.cat,
    beginningAt: beginningAt ?? this.beginningAt,
    startAt: startAt ?? this.startAt,
    endAt: endAt ?? this.endAt,
    endingAt: endingAt ?? this.endingAt,
    image: image ?? this.image,
  );
}
