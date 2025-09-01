part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

final class EmailChanged extends RegistrationEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

final class PasswordChanged extends RegistrationEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

final class PasswordConfirmChanged extends RegistrationEvent {
  final String password;

  const PasswordConfirmChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

final class RegistrationRequest extends RegistrationEvent {}
