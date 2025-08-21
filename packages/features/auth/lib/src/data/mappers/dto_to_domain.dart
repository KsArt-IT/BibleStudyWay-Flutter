import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserDtoToDomain on User {
  AuthUser toDomain() => AuthUser(
    uid: uid,
    email: email ?? '',
    name: displayName ?? 'No Name',
    photoUrl: photoURL, 
    //
  );
}
