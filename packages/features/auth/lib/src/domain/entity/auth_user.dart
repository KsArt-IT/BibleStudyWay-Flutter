/// {@template auth_user}
/// Entity for auth user.
/// {@endtemplate}
final class AuthUser {
  /// {@macro auth_user}
  const AuthUser({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  final String uid;
  final String email;
  final String name;
  final String? photoUrl;
}
