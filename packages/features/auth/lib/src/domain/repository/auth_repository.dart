import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

/// {@template auth_repository}
/// Репозиторій до роботи з Auth.
/// {@endtemplate}
abstract interface class AuthRepository with DiBaseRepo {
  /// Отримати поточного користувача
  Future<Result<AuthUser>> getCurrentUser();

  /// Оновити текучого користувача
  Future<Result<AuthUser>> refreshUser();

  /// Увійти в систему за допомогою [email] та [password]
  Future<Result<AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Зареєструватися за допомогою [email] та [password]
  Future<Result<AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Увійти в систему за допомогою Google
  Future<Result<AuthUser>> signInWithGoogle();

  /// Увійти в систему за допомогою Apple
  Future<Result<AuthUser>> signInWithApple();

  /// Вийти із системи
  Future<Result<void>> signOut();

  /// Надіслати [email] для скидання пароля
  Future<Result<void>> sendPasswordResetEmail(String email);

  /// Оновити [name]
  Future<Result<void>> updateName({required String name});

  /// Оновити [photoURL]
  Future<Result<void>> updatePhotoURL({required String photoURL});

  /// Видалити аккаунт
  Future<Result<void>> deleteAccount();
}
