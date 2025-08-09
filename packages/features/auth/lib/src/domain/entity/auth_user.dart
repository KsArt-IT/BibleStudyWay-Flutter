/// {@template auth_user}
/// Entity for auth user.
/// {@endtemplate}
final class AuthUser {
  /// {@macro auth_user}
  const AuthUser({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  final String id;
  final String email;
  final String name;
  final String avatar;
}
