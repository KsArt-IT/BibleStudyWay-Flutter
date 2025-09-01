part of 'registration_bloc.dart';

@immutable
final class RegistrationState extends Equatable {
  final StateStatus status;
  final Email email;
  final Password password;
  final Password passwordConfirm;
  final String? errorMessage;

  bool get isValid => email.isValid && password.isValid && password.value == passwordConfirm.value;

  const RegistrationState({
    this.status = StateStatus.initial,
    this.email = const Email(value: ''),
    this.password = const Password(value: ''),
    this.passwordConfirm = const Password(value: ''),
    this.errorMessage,
  });

  RegistrationState copyWith({
    StateStatus? status,
    Email? email,
    Password? password,
    Password? passwordConfirm,
    String? errorMessage,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, password, passwordConfirm, errorMessage];
}
