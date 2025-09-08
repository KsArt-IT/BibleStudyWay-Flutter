// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get lang => 'Русский';

  @override
  String get copyright => 'StudyWay.life';

  @override
  String get appTitle => 'Bible Study Way';

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String get l_exception => '----------';

  @override
  String get exceptionGeneral => 'An error occurred, please try again later.';

  @override
  String get exceptionDecodeEntityGeneral => 'Could not decode entity';

  @override
  String exceptionDecodeEntity(String entityName) {
    return 'Could not decode entity: $entityName';
  }

  @override
  String get exceptionHttpGeneral => 'A network error occurred during the request';

  @override
  String get exceptionHttpNotFound => 'The requested resource was not found';

  @override
  String get exceptionHttpForbidden => 'You don\'t have permissions to perform this action';

  @override
  String get exceptionHttpUnauthorized => 'This request was not authorized';

  @override
  String get exceptionAuthEmailExists => 'The provided email is already in use';

  @override
  String get exceptionAuthInvalidCredentials => 'Invalid login credentials';

  @override
  String get exceptionAuthInternalError => 'An internal error occurred';

  @override
  String get exceptionAuthInvalidEmail => 'The provided email is invalid';

  @override
  String get exceptionAuthInvalidPassword => 'The provided password is invalid';

  @override
  String get exceptionAuthInvalidPhone => 'The provided phone number is invalid';

  @override
  String get exceptionAuthPhoneExists => 'The provided phone number is already in use';

  @override
  String get exceptionAuthTooManyRequests => 'The number of requests exceeds the maximum allowed';

  @override
  String get exceptionAuthUserNotFound => 'No such user exists';

  @override
  String get exceptionAuthUserDisabled => 'User is disabled';

  @override
  String get exceptionAuthInvalidVerificationCode => 'The code entered is invalid';

  @override
  String get exceptionAuthRequiresRecentLogin => 'Additional authentication required';

  @override
  String get exceptionAuthUnknown => 'An unknown auth error occurred';

  @override
  String get exceptionAuthWeakPassword => 'Weak password!';

  @override
  String exceptionEntityNotFound(String entityName) {
    return 'The requested $entityName was not found';
  }

  @override
  String get exceptionEntityNotFoundGeneral => 'The requested entity was not found';

  @override
  String get l_0 => '---Bottom navigation---';

  @override
  String get main => 'Главная';

  @override
  String get lectures => 'Лекции';

  @override
  String get highlights => 'Основное';

  @override
  String get favorites => 'Избранное';

  @override
  String get more => 'Ещё';

  @override
  String get l_1 => '---Login screen---';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get registration => 'Registration';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Please check that the email you entered is correct.';

  @override
  String get password => 'Password';

  @override
  String get passwordInvalid => 'The password must be strong!';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get passwordConfirmInvalid => 'Check that the entered passwords match.';

  @override
  String get apple => 'Apple';

  @override
  String get google => 'Google';

  @override
  String get l_2 => '---Main screen---';

  @override
  String get l_3 => '---Lectures screen---';

  @override
  String get l_4 => '---Highlights screen---';

  @override
  String get l_5 => '---Favorites screen---';

  @override
  String get l_6 => '---More screen---';

  @override
  String get l_6_1 => '---Settings screen---';

  @override
  String get settingsApp => 'Настройки приложения';

  @override
  String get themeApp => 'Тема приложения';

  @override
  String get systemMode => 'Использовать настройки системы';

  @override
  String get darkMode => 'Тёмная тема';

  @override
  String get languageApp => 'Язык приложения';

  @override
  String get l_7 => '---Edit/Add lecture screen---';

  @override
  String get l_n => '---';
}
