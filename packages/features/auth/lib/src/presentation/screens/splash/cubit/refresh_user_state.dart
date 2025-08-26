part of 'refresh_user_cubit.dart';

@immutable
sealed class RefreshUserState {}

final class RefreshUserInitial extends RefreshUserState {}
final class RefreshUserFailure extends RefreshUserState {}
final class RefreshUserSuccess extends RefreshUserState {
  final AuthUser user;

  RefreshUserSuccess(this.user);
}
