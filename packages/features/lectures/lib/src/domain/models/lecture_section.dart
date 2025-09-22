class LectureSection {
  const LectureSection({
    required this.id,
    required this.title,
    required this.description,
    required this.tag, // for filtering lectures by category
    required this.lectures, // number of lectures in category
    this.image,
  });

  final String id;
  final String title;
  final String description;
  final String tag;
  final int lectures;
  final String? image;

  LectureSection copyWith({
    String? id,
    String? title,
    String? description,
    String? tag,
    int? lectures,
    String? image,
  }) => LectureSection(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    tag: tag ?? this.tag,
    lectures: lectures ?? this.lectures,
    image: image ?? this.image,
  );
}
