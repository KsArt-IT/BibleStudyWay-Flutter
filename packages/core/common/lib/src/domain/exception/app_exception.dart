import 'package:core_localization/localization.dart';
import 'package:flutter/foundation.dart';

sealed class AppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppFailure(this.message, this.stackTrace);

  String localizedMessage(AppLocalizations locale) =>
      kDebugMode ? message : locale.exceptionGeneral;

  @override
  String toString() => '$runtimeType: $message';
}

final class AuthFailure extends AppFailure {
  final String? code;

  AuthFailure(super.message, super.stackTrace, {this.code});

  @override
  String localizedMessage(AppLocalizations locale) {
    if (code?.isEmpty ?? true) return message;

    return switch (code) {
      'invalid' ||
      'INVALID_LOGIN_CREDENTIALS' ||
      'invalid-credential' => locale.exceptionAuthInvalidCredentials,
      'email-already-in-use' => locale.exceptionAuthEmailExists,
      'internal-error' => locale.exceptionAuthInternalError,
      'user-disabled' => locale.exceptionAuthUserDisabled,
      'invalid-email' => locale.exceptionAuthInvalidEmail,
      'invalid-password' => locale.exceptionAuthInvalidPassword,
      'invalid-phone-number' => locale.exceptionAuthInvalidPhone,
      'weak-password' => locale.exceptionAuthWeakPassword,
      'phone-number-already-exists' => locale.exceptionAuthPhoneExists,
      'too-many-requests' => locale.exceptionAuthTooManyRequests,
      'user-not-found' => locale.exceptionAuthUserNotFound,
      'invalid-verification-code' => locale.exceptionAuthInvalidVerificationCode,
      'requires-recent-login' => locale.exceptionAuthRequiresRecentLogin,
      _ when kDebugMode => '[debug] $code: $message',
      _ => locale.exceptionAuthUnknown,
    };
  }
}

final class DataFailure extends AppFailure {
  final String? code;

  DataFailure(super.message, super.stackTrace, {this.code});

  @override
  String localizedMessage(AppLocalizations locale) {
    if (code?.isEmpty ?? true) return message;

    return switch (code) {
      'invalid' ||
      'INVALID_LOGIN_CREDENTIALS' ||
      'invalid-credential' => locale.exceptionAuthInvalidCredentials,
      'failed-precondition' => locale.exceptionGeneral, // The query requires an index.
      'permission-denied' => locale.exceptionPermissionDenied,
      _ when kDebugMode => '[debug] $code: $message',
      _ => locale.exceptionGeneral,
    };
  }
}

final class NetworkFailure extends AppFailure {
  NetworkFailure(super.message, super.stackTrace);
}

final class DecodeFailure extends AppFailure {
  final String? entityName;

  DecodeFailure(StackTrace stackTrace, {this.entityName})
    : super('Could not decode ${entityName != null ? '`$entityName`' : 'entity'}', stackTrace);

  @override
  String localizedMessage(AppLocalizations locale) {
    final entityName = this.entityName;

    return entityName != null
        ? locale.exceptionDecodeEntity(entityName)
        : locale.exceptionDecodeEntityGeneral;
  }
}

class NotFoundFailure extends AppFailure {
  final String? entityName;

  NotFoundFailure([this.entityName])
    : super('The requested ${entityName ?? 'entity'} was not found', StackTrace.current);

  @override
  String localizedMessage(AppLocalizations locale) {
    final entityName = this.entityName;

    return entityName != null
        ? locale.exceptionEntityNotFound(entityName)
        : locale.exceptionEntityNotFoundGeneral;
  }
}
