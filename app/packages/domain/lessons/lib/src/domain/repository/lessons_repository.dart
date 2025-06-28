import 'package:core_common/common.dart';

/// {@template LessonsRepository}
/// Інтерфейс для роботи з репозиторієм уроків
/// {@endtemplate}
abstract interface class LessonsRepository with DiBaseRepo {
  @override
  String get name => 'LessonsRepository';
}