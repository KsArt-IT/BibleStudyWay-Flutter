import 'package:core_common/common.dart';
import 'package:lectures/src/domain/models/lecture.dart';
import 'package:lectures/src/domain/models/lecture_section.dart';

abstract interface class LectureRepository {
  Future<Result<List<LectureSection>>> fetchLectureSections();
  Future<Result<LectureSection?>> fetchLectureSectionById(String id);
  Future<Result<LectureSection?>> fetchLectureSectionByTag(String tag);

  Future<Result<List<Lecture>>> fetchLectures();
  Future<Result<List<Lecture>>> fetchLecturesByTag(String tag);
  Future<Result<List<Lecture>>> fetchLecturesByCat(String cat);
  Future<Result<Lecture?>> fetchLectureById(String id);
}
