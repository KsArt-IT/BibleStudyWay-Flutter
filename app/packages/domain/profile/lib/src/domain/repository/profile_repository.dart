import 'package:core_common/common.dart';

/// {@template ProfileRepository}
/// Інтерфейс для роботи з репозиторієм профілю, прогресу
/// {@endtemplate}
abstract interface class ProfileRepository with DiBaseRepo {
  @override
  String get name => 'ProfileRepository';
}