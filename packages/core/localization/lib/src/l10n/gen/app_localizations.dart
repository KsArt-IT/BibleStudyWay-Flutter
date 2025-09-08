import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru'), Locale('uk')];

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get lang;

  /// Copyright text
  ///
  /// In en, this message translates to:
  /// **'StudyWay.life'**
  String get copyright;

  /// Study the Bible with us, Study Way Life.
  ///
  /// In en, this message translates to:
  /// **'Bible Study Way'**
  String get appTitle;

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @l_exception.
  ///
  /// In en, this message translates to:
  /// **'----------'**
  String get l_exception;

  /// No description provided for @exceptionGeneral.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get exceptionGeneral;

  /// No description provided for @exceptionDecodeEntityGeneral.
  ///
  /// In en, this message translates to:
  /// **'Could not decode entity'**
  String get exceptionDecodeEntityGeneral;

  /// No description provided for @exceptionDecodeEntity.
  ///
  /// In en, this message translates to:
  /// **'Could not decode entity: {entityName}'**
  String exceptionDecodeEntity(String entityName);

  /// No description provided for @exceptionHttpGeneral.
  ///
  /// In en, this message translates to:
  /// **'A network error occurred during the request'**
  String get exceptionHttpGeneral;

  /// No description provided for @exceptionHttpNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found'**
  String get exceptionHttpNotFound;

  /// No description provided for @exceptionHttpForbidden.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permissions to perform this action'**
  String get exceptionHttpForbidden;

  /// No description provided for @exceptionHttpUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'This request was not authorized'**
  String get exceptionHttpUnauthorized;

  /// No description provided for @exceptionAuthEmailExists.
  ///
  /// In en, this message translates to:
  /// **'The provided email is already in use'**
  String get exceptionAuthEmailExists;

  /// No description provided for @exceptionAuthInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid login credentials'**
  String get exceptionAuthInvalidCredentials;

  /// No description provided for @exceptionAuthInternalError.
  ///
  /// In en, this message translates to:
  /// **'An internal error occurred'**
  String get exceptionAuthInternalError;

  /// No description provided for @exceptionAuthInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'The provided email is invalid'**
  String get exceptionAuthInvalidEmail;

  /// No description provided for @exceptionAuthInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'The provided password is invalid'**
  String get exceptionAuthInvalidPassword;

  /// No description provided for @exceptionAuthInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is invalid'**
  String get exceptionAuthInvalidPhone;

  /// No description provided for @exceptionAuthPhoneExists.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is already in use'**
  String get exceptionAuthPhoneExists;

  /// No description provided for @exceptionAuthTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'The number of requests exceeds the maximum allowed'**
  String get exceptionAuthTooManyRequests;

  /// No description provided for @exceptionAuthUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No such user exists'**
  String get exceptionAuthUserNotFound;

  /// No description provided for @exceptionAuthUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'User is disabled'**
  String get exceptionAuthUserDisabled;

  /// No description provided for @exceptionAuthInvalidVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'The code entered is invalid'**
  String get exceptionAuthInvalidVerificationCode;

  /// No description provided for @exceptionAuthRequiresRecentLogin.
  ///
  /// In en, this message translates to:
  /// **'Additional authentication required'**
  String get exceptionAuthRequiresRecentLogin;

  /// No description provided for @exceptionAuthUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown auth error occurred'**
  String get exceptionAuthUnknown;

  /// No description provided for @exceptionAuthWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Weak password!'**
  String get exceptionAuthWeakPassword;

  /// No description provided for @exceptionEntityNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested {entityName} was not found'**
  String exceptionEntityNotFound(String entityName);

  /// No description provided for @exceptionEntityNotFoundGeneral.
  ///
  /// In en, this message translates to:
  /// **'The requested entity was not found'**
  String get exceptionEntityNotFoundGeneral;

  /// No description provided for @l_0.
  ///
  /// In en, this message translates to:
  /// **'---Bottom navigation---'**
  String get l_0;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @lectures.
  ///
  /// In en, this message translates to:
  /// **'Lectures'**
  String get lectures;

  /// No description provided for @highlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @l_1.
  ///
  /// In en, this message translates to:
  /// **'---Login screen---'**
  String get l_1;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please check that the email you entered is correct.'**
  String get emailInvalid;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordInvalid.
  ///
  /// In en, this message translates to:
  /// **'The password must be strong!'**
  String get passwordInvalid;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @passwordConfirmInvalid.
  ///
  /// In en, this message translates to:
  /// **'Check that the entered passwords match.'**
  String get passwordConfirmInvalid;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @l_2.
  ///
  /// In en, this message translates to:
  /// **'---Main screen---'**
  String get l_2;

  /// No description provided for @l_3.
  ///
  /// In en, this message translates to:
  /// **'---Lectures screen---'**
  String get l_3;

  /// No description provided for @l_4.
  ///
  /// In en, this message translates to:
  /// **'---Highlights screen---'**
  String get l_4;

  /// No description provided for @l_5.
  ///
  /// In en, this message translates to:
  /// **'---Favorites screen---'**
  String get l_5;

  /// No description provided for @l_6.
  ///
  /// In en, this message translates to:
  /// **'---More screen---'**
  String get l_6;

  /// No description provided for @l_6_1.
  ///
  /// In en, this message translates to:
  /// **'---Settings screen---'**
  String get l_6_1;

  /// No description provided for @settingsApp.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get settingsApp;

  /// No description provided for @themeApp.
  ///
  /// In en, this message translates to:
  /// **'Application theme'**
  String get themeApp;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'Use system settings'**
  String get systemMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @languageApp.
  ///
  /// In en, this message translates to:
  /// **'Application language'**
  String get languageApp;

  /// No description provided for @l_7.
  ///
  /// In en, this message translates to:
  /// **'---Edit/Add lecture screen---'**
  String get l_7;

  /// No description provided for @l_n.
  ///
  /// In en, this message translates to:
  /// **'---'**
  String get l_n;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
